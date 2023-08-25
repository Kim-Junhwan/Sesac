//
//  DefaultTextField.swift
//  CodeLayout
//
//  Created by JunHwan Kim on 2023/08/25.
//

import UIKit

class DefaultTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func config(placeHolderTitle: String){
        backgroundColor = .gray
        textAlignment = .center
        attributedPlaceholder = NSAttributedString(string: placeHolderTitle, attributes: [NSAttributedString.Key.foregroundColor : UIColor.white])
        layer.cornerRadius = 5
        clipsToBounds = true
    }
    
}
