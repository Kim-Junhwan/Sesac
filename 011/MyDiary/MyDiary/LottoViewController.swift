//
//  LottoViewController.swift
//  MyDiary
//
//  Created by JunHwan Kim on 2023/08/03.
//

import UIKit
import Alamofire
import SwiftyJSON

class LottoViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var numberTextField: UITextField!
    let pickerView = UIPickerView()
    
    var list = ["영화","드라마","애니메이션"]

    override func viewDidLoad() {
        super.viewDidLoad()
        numberTextField.inputView = pickerView
        pickerView.delegate = self
        pickerView.dataSource = self
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(endEditing)))
        requestServer(num: 20230702) { str in
            print(str)
        }
        
    }
    
    func requestServer(num: Int,completion: @escaping (String)-> Void) {
        let url = "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=f5eef3421c602c6cb7ea224104795888&targetDt=\(num)"
        AF.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let date = json["drwNoDate"].stringValue
                let bonusNum = json["bnusNo"].intValue
                completion(date)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    @objc func endEditing() {
        view.endEditing(false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(view.window?.screen.bounds.width)
        
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        print(view.window?.screen.bounds.width)
    }
//
//    override func viewWillLayoutSubviews() {
//        //print(view.window?.screen.bounds.width)
//    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return list.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        numberTextField.text = list[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return list[row]
    }
}
