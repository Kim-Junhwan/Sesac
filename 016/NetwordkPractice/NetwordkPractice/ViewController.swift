//
//  ViewController.swift
//  NetwordkPractice
//
//  Created by JunHwan Kim on 2023/08/08.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet weak var lottoRoundTextField: UITextField!
    let pickerView: UIPickerView = UIPickerView()
    let lottoRoundList: [Int] = Array(1...1079).reversed()
    
    @IBOutlet weak var lottoNumLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        lottoRoundTextField.inputView = pickerView
        pickerView.delegate = self
        pickerView.dataSource = self
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(endEditing)))
        fetchLottoNumber(round: 1079)
    }
    
    @objc func endEditing() {
        view.endEditing(true)
    }
    
    func getLottoNumber(round: Int) {
        let url = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber&drwNo=\(round)"
        AF.request(url, method: .get).validate().response { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                var lottoNum: [String] = []
                for num in 1...6 {
                    lottoNum.append(json["drwtNo\(num)"].stringValue)
                }
                lottoNum.append("+\(json["bnusNo"].stringValue)")
                self.lottoNumLabel.text = lottoNum.joined(separator: " ")
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        lottoRoundList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(lottoRoundList[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lottoRoundTextField.text = String(lottoRoundList[row])
        fetchLottoNumber(round: lottoRoundList[row])
    }
    
}
