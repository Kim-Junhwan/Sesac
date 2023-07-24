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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
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


}

