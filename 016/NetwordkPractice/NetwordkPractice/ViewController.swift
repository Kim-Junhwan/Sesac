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
    @IBOutlet weak var lottoNumLabel: UILabel!
    let viewModel = LottoViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lottoRoundTextField.inputView = pickerView
        pickerView.delegate = self
        pickerView.dataSource = self
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(endEditing)))
        viewModel.lotto.subscribe { lotto in
            self.lottoNumLabel.text = lotto
        }
    }
    
    @objc func endEditing() {
        view.endEditing(true)
    }
    
    
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        viewModel.lottoRoundList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(viewModel.lottoRoundList[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        viewModel.fetchLottoNum(indexRow: row)
        lottoRoundTextField.text = String(viewModel.lottoRoundList[row])
    }
    
}
