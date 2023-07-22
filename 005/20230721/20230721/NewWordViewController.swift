//
//  NewWorldViewController.swift
//  20230721
//
//  Created by JunHwan Kim on 2023/07/21.
//

import UIKit

class NewWordViewController: UIViewController {
    
    @IBOutlet weak var newWorldLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.text = getRanfomNewWord()
        tapTextFieldReturnKey(searchTextField)
    }
    
    func getRanfomNewWord() -> String {
        let random = ["고래밥","칙촉","카스타드","메로나"]
        return random.randomElement()!
    }
    
    @IBAction func tapTextFieldReturnKey(_ sender: UITextField) {
        newWorldLabel.text = newWordExplainLogin(newWord: sender.text!)
    }
    
    @IBAction func tapNewWorldButton(_ sender: UIButton) {
        searchTextField.text = sender.titleLabel?.text
        tapTextFieldReturnKey(searchTextField)
        
    }
    
    func newWordExplainLogin(newWord: String) -> String {
        switch newWord {
        case "별다줄" :
            return "별거 다 줄인다"
        case "뉴진스" :
            return "모름"
        default :
            return "error"
        }
    }
}
