//
//  DefaultImageView.swift
//  CodeLayout
//
//  Created by JunHwan Kim on 2023/08/24.
//

import UIKit

class DefaultImageView: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setConfig()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConfig() {
        layer.borderColor = UIColor.gray.cgColor
        layer.borderWidth = 2.0
        clipsToBounds = true
        contentMode = .scaleAspectFill
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.height/2
    }

}
