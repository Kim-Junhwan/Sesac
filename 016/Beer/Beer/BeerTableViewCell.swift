//
//  BeerTableViewCell.swift
//  Beer
//
//  Created by JunHwan Kim on 2023/08/08.
//

import UIKit

class BeerTableViewCell: UITableViewCell {
    
    static let identifier = "BeerTableViewCell"

    @IBOutlet weak var beerNameLabel: UILabel!
    @IBOutlet weak var beerImageView: UIImageView!
    
    func configureCell(beer: Beer) {
        beerNameLabel.text = beer.name
        beerImageView.getImageFromUrl(url: beer.image_url)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
