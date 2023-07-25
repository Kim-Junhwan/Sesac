//
//  ViewController.swift
//  Emotion
//
//  Created by JunHwan Kim on 2023/07/25.
//

import UIKit

class ViewController: UIViewController {
    
    var emotionScoreList: [Int] = Array(repeating: 0, count: Emotion.allCases.count)

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func tapEmotion(_ sender: UIButton) {
        emotionScoreList[sender.tag] += 1
        if let emotion = Emotion(rawValue: sender.tag)?.currentCase() {
            print("\(emotion) \(emotionScoreList[sender.tag])")
        }
        
    }
    
}

