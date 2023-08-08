//
//  DetailViewController.swift
//  MyDiary
//
//  Created by JunHwan Kim on 2023/07/31.
//

import UIKit

class DetailViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    
    @IBAction func tapDeleteButton(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
}
