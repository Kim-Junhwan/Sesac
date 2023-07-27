//
//  ViewController.swift
//  BaeminUI
//
//  Created by JunHwan Kim on 2023/07/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var aView: UIView!
    
    @IBOutlet weak var bView: VCustomView!
    
    override func viewDidLoad() {
        print(bView.layer)
    }
    @objc func imageTap(_ sender: UITapGestureRecognizer) {
        print("tapped")
        
    }
    
}

