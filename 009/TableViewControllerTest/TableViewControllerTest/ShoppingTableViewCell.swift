//
//  ShoppingTableViewCell.swift
//  TableViewControllerTest
//
//  Created by JunHwan Kim on 2023/07/29.
//

import UIKit

class ShoppingTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var starButton: UIButton!
    @IBOutlet weak var shoppingLabel: UILabel!
    
    static let identifier: String = "ShoppingTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell() {
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
