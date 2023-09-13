//
//  PhotoTableViewCell.swift
//  LocalizationTest
//
//  Created by JunHwan Kim on 2023/09/13.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {

    @IBOutlet weak var photoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        photoImageView.contentMode = .scaleToFill
    }
    
    func configureCell(photo: PhotoResult) {
        photoImageView.setImageFromImagePath(imagePath: photo.urls.thumb)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
