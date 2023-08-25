//
//  ViewController.swift
//  CodeLayout
//
//  Created by JunHwan Kim on 2023/08/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    @IBAction func tapLocationButton(_ sender: UIButton) {
        let vc = LocationViewController()
        present(vc, animated: true)
    }
}

