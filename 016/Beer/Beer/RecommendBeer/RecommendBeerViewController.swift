//
//  RecommendBeerViewController.swift
//  Beer
//
//  Created by JunHwan Kim on 2023/08/08.
//

import UIKit

class RecommendBeerViewController: UIViewController {

    @IBOutlet weak var beerImage: UIImageView!
    @IBOutlet weak var beerLabel: UILabel!
    @IBOutlet weak var beerDiscusstionLabel: UILabel!
    
    let viewModel = RecommendBeerViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        viewModel.fetchRecommendBeer()
    }
    
    private func bind() {
        viewModel.beer.subscribe { beer in
            self.beerLabel.text = beer.name
            self.beerDiscusstionLabel.text = beer.description
            self.beerImage.getImageFromUrl(url: beer.image_url!)
        }
    }

    @IBAction func tapRecommendBeer(_ sender: UIButton) {
        viewModel.fetchRecommendBeer()
    }
}
