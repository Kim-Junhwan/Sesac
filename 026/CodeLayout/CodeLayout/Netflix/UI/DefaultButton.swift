//
//  DefaultButton.swift
//  CodeLayout
//
//  Created by JunHwan Kim on 2023/08/25.
//

import UIKit

class DefaultButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConfig(image: UIImage?, text: String) {
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = .white
        config.baseForegroundColor = .black
        config.imagePlacement = .top
        config.attributedTitle = AttributedString(text, attributes: AttributeContainer([.font:UIFont.boldSystemFont(ofSize: 15)]))
        config.image = image
        configuration = config
    }

}
