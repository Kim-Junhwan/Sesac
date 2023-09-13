//
//  LottoAPIManager.swift
//  NetwordkPractice
//
//  Created by JunHwan Kim on 2023/09/13.
//

import Foundation
import Alamofire

struct Lotto: Decodable {
    let drwtNo1: Int
    let drwtNo2: Int
    let drwtNo3: Int
    let drwtNo4: Int
    let drwtNo5: Int
    let drwtNo6: Int
    let bnusNo: Int
    
    init() {
        self.drwtNo1 = 0
        self.drwtNo2 = 0
        self.drwtNo3 = 0
        self.drwtNo4 = 0
        self.drwtNo5 = 0
        self.drwtNo6 = 0
        self.bnusNo = 0
    }
}

class LottoAPIManager {
    func getLottoNumber(round: Int, completion: @escaping(Result<Lotto, Error>) -> Void) {
        let url = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=\(round)"
        AF.request(url, method: .get).validate().responseDecodable(of: Lotto.self) { response in
            switch response.result {
            case .success(let lotto):
                completion(.success(lotto))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
