//
//  MovieViewController.swift
//  20230718
//
//  Created by JunHwan Kim on 2023/07/19.
//

import UIKit

class MovieViewController: UIViewController {
    
    enum Metric: Double {
        case imageViewBorderWidth = 3.0
        case imageViewCornerRadius = 50.0
    }
    
    @IBOutlet var previewImageViewList: [UIImageView]!
    @IBOutlet weak var mainPosterImageView: UIImageView!
    @IBOutlet weak var randomPlayButton: UIButton!
    
    let movieTitleLlist: [String] = ["신과함께인과연","신과함께죄와벌","아바타","알라딘","1","2","3","4","5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutPreviewImageView()
    }
    
    func layoutPreviewImageView() {
        for previewImageView in previewImageViewList {
            layoutImageView(imageView: previewImageView)
        }
    }
    
    func layoutImageView(imageView: UIImageView) {
        imageView.layer.cornerRadius = Metric.imageViewCornerRadius.rawValue
        imageView.layer.borderWidth = Metric.imageViewBorderWidth.rawValue
        imageView.layer.borderColor = UIColor.green.cgColor
    }
    
    @IBAction func randomPlayButtonClicked(_ sender: UIButton) {
        let imageViewList: [UIImageView] = previewImageViewList + [mainPosterImageView]
        for imageView in imageViewList {
            setRandomImageAtImageView(imageView: imageView)
        }
    }
    
    func setRandomImageAtImageView(imageView: UIImageView) {
        let randomMovieTitle: String = movieTitleLlist.randomElement()!
        imageView.image = UIImage(named: randomMovieTitle)
    }
    
}
