//
//  DefaultLabel.swift
//  CodeLayout
//
//  Created by JunHwan Kim on 2023/08/24.
//

import UIKit

final class DefaultLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setConfig()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setConfig() {
        textColor = .white
        font = UIFont.systemFont(ofSize: 17.0, weight: .bold)
    }
    
}
