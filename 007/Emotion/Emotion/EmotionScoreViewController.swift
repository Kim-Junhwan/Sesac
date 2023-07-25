//
//  EmotionScoreViewController.swift
//  Emotion
//
//  Created by JunHwan Kim on 2023/07/25.
//

import UIKit

class EmotionScoreViewController: UIViewController {

    @IBOutlet var emotionScoreViewList: [UIStackView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
    }
    
    func layout() {
        emotionScoreViewList.forEach { emotionView in
            layoutEmotionScoreView(view: emotionView)
        }
    }
    
    func layoutEmotionScoreView(view: UIView) {
        view.layer.cornerRadius = 10.0
    }

}
