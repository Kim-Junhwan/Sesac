//
//  NetworkManager.swift
//  Translate
//
//  Created by JunHwan Kim on 2023/08/10.
//

import Foundation
import Alamofire
import SwiftyJSON

struct NetworkManager {
    let header: HTTPHeaders = ["X-Naver-Client-Id":APIKey.naverKey, "X-Naver-Client-Secret":APIKey.naverSecretKey]
    
    func getLanguage(text: String, completion: @escaping (String) -> Void){
        let url = "https://openapi.naver.com/v1/papago/detectLangs"
        AF.request(url, method: .post, parameters: ["query":text], headers: header).response { (response) in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                completion(json["langCode"].stringValue)
            case .failure(let error):
                print("error : \(error.errorDescription!)")
            }
        }
    }
    
    func translate(source: String, target: String, text: String, completion: @escaping (String) -> Void) {
        let url = "https://openapi.naver.com/v1/papago/n2mt"
        AF.request(url, method: .post, parameters: ["source":source, "target":target, "text":text], headers: header).response { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                completion(json["message"]["result"]["translatedText"].stringValue)
            case .failure(let error):
                print(error)
            }
        }
    }
}
