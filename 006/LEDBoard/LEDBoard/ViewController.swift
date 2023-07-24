//
//  ViewController.swift
//  LEDBoard
//
//  Created by JunHwan Kim on 2023/07/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var actionStackView: UIStackView!
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var changeTextColorButton: UIButton!
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        changeRandomColor(changeTextColorButton)
    }
    
    func getRandomColor() -> UIColor {
        return UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1.0)
    }
    
    func layout() {
        buttonLayout(button: sendButton)
        buttonLayout(button: changeTextColorButton)
        layoutMessageTextField()
        layoutActionStackView()
    }
    
    func layoutActionStackView() {
        actionStackView.layer.cornerRadius = 10.0
    }
    
    func layoutMessageTextField() {
        messageTextField.layer.borderWidth = 1.0
        messageTextField.layer.borderColor = UIColor.white.cgColor
    }
    
    func buttonLayout(button: UIButton) {
        button.layer.cornerRadius = 10.0
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1.0
    }
    
    @IBAction func bindLabelToTextField(sender: Any?) {
        guard let text = messageTextField.text else { return }
        messageTextField.text = ""
        textLabel.text = text
        closeKeyboard(nil)
    }

    @IBAction func changeRandomColor(_ sender: UIButton) {
        let randomColor = getRandomColor()
        changeTextColorButton.tintColor = randomColor
        textLabel.textColor = randomColor
        
    }
    
    @IBAction func tapReturnKey(_ sender: UITextField) {
        bindLabelToTextField(sender: nil)
    }
    
    func closeKeyboard(_ sender: Any?) {
        view.endEditing(true)
    }
    
    
}

