//
//  MovieTableViewCell.swift
//  CustomCellTableView
//
//  Created by JunHwan Kim on 2023/07/28.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var runtimeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    func configureCell(movie: Movie) {
        posterImageView.image = UIImage(named: movie.title)
        movieNameLabel.text = movie.title
        releaseDateLabel.text = movie.releaseDate
        runtimeLabel.text = String(movie.runtime)
        scoreLabel.text = String(movie.rate)
        overviewLabel.text = movie.overview
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
