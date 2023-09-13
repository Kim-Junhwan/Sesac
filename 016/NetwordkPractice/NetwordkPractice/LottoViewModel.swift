//
//  LottoViewModel.swift
//  NetwordkPractice
//
//  Created by JunHwan Kim on 2023/09/13.
//

import Foundation
import Alamofire
import SwiftyJSON

class LottoViewModel {
    
    let lottoManager = LottoAPIManager()
    let lottoRoundList: [Int] = Array(1...1079).reversed()
    let lotto = Observable(value: "")
    
    func fetchLottoNum(indexRow: Int) {
        let round = lottoRoundList[indexRow]
        lottoManager.getLottoNumber(round: round) { result in
            switch result {
            case .success(let success):
                self.lotto.value = "\(success.drwtNo1) \(success.drwtNo2) \(success.drwtNo3) \(success.drwtNo4) \(success.drwtNo5) \(success.drwtNo6) +\(success.bnusNo)"
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
