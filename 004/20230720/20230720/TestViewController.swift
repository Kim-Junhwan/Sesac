//
//  TestViewController.swift
//  20230720
//
//  Created by JunHwan Kim on 2023/07/20.
//

import UIKit

class TestViewController: UIViewController {
    

    @IBOutlet weak var newButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = .black
        config.title = "Hello"
        config.subtitle = "World!"
        config.baseForegroundColor = .white
        config.image = UIImage(systemName: "play.fill")
        config.imagePadding = 10.0
        config.cornerStyle = .capsule
        config.titleAlignment = .automatic
        newButton.configuration = config
    }
    
    @IBAction func tap(_ sender: Any) {
    }
}
