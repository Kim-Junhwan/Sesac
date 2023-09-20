//
//  NetworkService.swift
//  Beer
//
//  Created by JunHwan Kim on 2023/09/20.
//

import Foundation
import Alamofire

final class NetworkService {
    static let shared = NetworkService()
    
    private init() {}
    
    func request<T: Decodable> (endpoint: URLRequestConvertible, responseType: T.Type ,completion: @escaping(Result<T, Error>) -> Void) {
        AF.request(endpoint).responseDecodable(of: responseType.self) { response in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
