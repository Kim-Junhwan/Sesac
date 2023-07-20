//
//  ViewController.swift
//  20230720
//
//  Created by JunHwan Kim on 2023/07/20.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func clickButton(_ sender: UIButton) {
        let alert = UIAlertController(title: "asjdlkasjlaljksjdlkajskdjalsdjlk", message: "", preferredStyle: .actionSheet)
        let cancelButton = UIAlertAction(title: "취소", style: .cancel)
        let defaultButton1 = UIAlertAction(title: "3", style: .default)
        let defaultButton2 = UIAlertAction(title: "2", style: .default)
        let destructiveButton = UIAlertAction(title: "1", style: .destructive)
        alert.addAction(cancelButton)
        alert.addAction(defaultButton1)
        alert.addAction(defaultButton2)
        alert.addAction(destructiveButton)
        present(alert, animated: true)
    }
    
}

