//
//  ViewController.swift
//  Translate
//
//  Created by JunHwan Kim on 2023/08/10.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var translatingLanguageLabel: UILabel!
    @IBOutlet weak var translatingTextView: UITextView!
    @IBOutlet weak var translatedTextView: UITextView!
    
    let networkManager = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func taoTranslateButton(_ sender: UIButton) {
        let translatingText = translatingTextView.text!
        networkManager.getLanguage(text: translatingText) { language in
            self.translatingLanguageLabel.text = Language(rawValue: language)?.language
            self.networkManager.translate(source: language, target: "ko", text: translatingText) { translatedText in
                self.translatedTextView.text = translatedText
            }
        }
    }
}

