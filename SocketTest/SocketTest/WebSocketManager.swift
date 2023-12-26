//
//  WebSocketManager.swift
//  SocketTest
//
//  Created by JunHwan Kim on 2023/12/26.
//

import Foundation
import Combine

final class WebSocketManager: NSObject {
    static let shared = WebSocketManager()
    
    private override init() {
        super.init()
    }
    
    private var webSocket: URLSessionWebSocketTask?
    private var timer: Timer?
    private var isOpen = false
    var orderBoolSbj = PassthroughSubject<OrderBookWS, Never>()
    
    func openWebSocket() {
        if let url = URL(string: "wss://api.upbit.com/websocket/v1") {
            let session = URLSession(configuration: .default, delegate: self, delegateQueue: nil)
            webSocket = session.webSocketTask(with: url)
            webSocket?.resume()
            ping()
        }
    }
    
    func closeWebSocket() {
        webSocket?.cancel(with: .goingAway, reason: nil)
        webSocket = nil
        
        timer?.invalidate()
        timer = nil
        
        isOpen = false
    }
    
    func send() {
        let str = """
        [{"ticket":"test"},{"type":"orderbook","codes":["KRW-BTC"]}]
        """
        webSocket?.send(.string(str), completionHandler: { error in
            if let error {
                print("send error \(error)")
            }
        })
    }
    
    func receive() {
        if isOpen {
            webSocket?.receive(completionHandler: { result in
                switch result {
                case .success(let success):
                    switch success {
                    case .data(let data):
                        if let decodeData = try? JSONDecoder().decode(OrderBookWS.self, from: data) {
                            self.orderBoolSbj.send(decodeData)
                        }
                    case .string(let data):
                        print("\(data)")
                    @unknown default:
                        break
                    }
                case .failure(let failure):
                    self.closeWebSocket()
                }
                self.receive()
            })
        }
    }
    
    private func ping() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: true, block: { [weak self] _ in
            self?.webSocket?.sendPing(pongReceiveHandler: { error in
                if let error {
                    print(error)
                } else {
                    print("Ping")
                }
            })
        })
        
    }
}

extension WebSocketManager: URLSessionWebSocketDelegate {
    func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didOpenWithProtocol protocol: String?) {
        isOpen = true
        receive()
    }
    
    func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didCloseWith closeCode: URLSessionWebSocketTask.CloseCode, reason: Data?) {
        isOpen = false
    }
}

struct OrderBookWS: Decodable {
  let timestamp: Int
  let totalAskSize, totalBidSize: Double
  let orderbookUnits: [OrderbookUnit]

  enum CodingKeys: String, CodingKey {
    case timestamp
    case totalAskSize = "total_ask_size"
    case totalBidSize = "total_bid_size"
    case orderbookUnits = "orderbook_units"
  }
}

struct OrderbookUnit: Hashable, Codable {
  let askPrice, bidPrice: Double
  let askSize, bidSize: Double

  enum CodingKeys: String, CodingKey {
    case askPrice = "ask_price"
    case bidPrice = "bid_price"
    case askSize = "ask_size"
    case bidSize = "bid_size"
  }
}

struct OrderbookItem: Hashable, Identifiable {
  let id = UUID()
  let price: Double
  let size: Double
}
