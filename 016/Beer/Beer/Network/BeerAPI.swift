//
//  BeerAPI.swift
//  Beer
//
//  Created by JunHwan Kim on 2023/09/20.
//

import Foundation
import Alamofire

enum BeerAPI: URLRequestConvertible {
    
    case getBeerList
    case detailBeer(id: Int)
    case getRandomBeer
    
    private var baseURL: URL {
        return URL(string: "https://api.punkapi.com/v2/")!
    }
    
    private var path: String {
        switch self {
        case .getBeerList:
            return "beers"
        case .detailBeer(let id):
            return "beers/\(id)"
        case .getRandomBeer:
            return "beers/random"
        }
    }
    
    private var method: HTTPMethod {
        return .get
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        let request = try URLRequest(url: url, method: method)
        return request
    }
    
}
