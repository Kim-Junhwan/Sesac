//
//  TranslateViewController.swift
//  Translate
//
//  Created by JunHwan Kim on 2023/08/10.
//

import UIKit

class TranslateViewController: UIViewController {

    @IBOutlet weak var startLanguageTextField: UITextField!
    @IBOutlet weak var startLanguageTextView: UITextView!
    @IBOutlet weak var endLanguageTextField: UITextField!
    @IBOutlet weak var endLanguageTextView: UITextView!
    let startPickerView = UIPickerView()
    let endPickerView = UIPickerView()
    let networkManage = NetworkManager()
    let startToolBar = UIToolbar()
    let endToolBar = UIToolbar()
    
    let language = Language.allCases
    var startLanguage: Language = .en
    var endLanguage: Language = .ko
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startLanguageTextField.inputView = startPickerView
        startPickerView.delegate = self
        startPickerView.dataSource = self
        endLanguageTextField.inputView = endPickerView
        endPickerView.delegate = self
        endPickerView.dataSource = self
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(endEditing)))
        setToolBar(textField: startLanguageTextField, toolBar: startToolBar)
        setToolBar(textField: endLanguageTextField, toolBar: endToolBar)
    }
    
    func setToolBar(textField: UITextField, toolBar: UIToolbar) {
        toolBar.backgroundColor = .darkGray
        toolBar.frame = CGRect(x: 0, y: 0, width: 0, height: 40)
        
        let barButton = UIBarButtonItem()
        barButton.title = "Done"
        barButton.target = self
        if textField == startLanguageTextField {
            startLanguageTextField.inputAccessoryView = startToolBar
            barButton.action = #selector(startTextFieldAction)
        } else {
            endLanguageTextField.inputAccessoryView = endToolBar
            barButton.action = #selector(endTextFieldAction)
        }
        toolBar.setItems([UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),barButton], animated: true)
    }
    
    @objc func startTextFieldAction() {
        startLanguageTextField.text = language[startPickerView.selectedRow(inComponent: 0)].language
        startLanguage = language[startPickerView.selectedRow(inComponent: 0)]
        endEditing()
    }
    
    @objc func endTextFieldAction() {
        endLanguageTextField.text = language[endPickerView.selectedRow(inComponent: 0)].language
        endLanguage = language[endPickerView.selectedRow(inComponent: 0)]
        endEditing()
    }
    
    @objc func endEditing() {
        view.endEditing(true)
    }
    
    @IBAction func tapTranslateButton(_ sender: UIButton) {
        networkManage.translate(source: startLanguage.rawValue, target: endLanguage.rawValue, text: startLanguageTextView.text) { translatedText in
            self.endLanguageTextView.text = translatedText
        }
    }
    
}

extension TranslateViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        language.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return language[row].language
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectLanguage = language[row]
        if pickerView == startPickerView {
            startLanguage = selectLanguage
            startLanguageTextField.text = selectLanguage.language
        } else {
            endLanguage = selectLanguage
            endLanguageTextField.text = selectLanguage.language
        }
    }
    
    
    
}
