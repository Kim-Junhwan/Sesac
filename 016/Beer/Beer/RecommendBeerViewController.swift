//
//  RecommendBeerViewController.swift
//  Beer
//
//  Created by JunHwan Kim on 2023/08/08.
//

import UIKit
import Alamofire
import SwiftyJSON

class RecommendBeerViewController: UIViewController {

    @IBOutlet weak var beerImage: UIImageView!
    @IBOutlet weak var beerLabel: UILabel!
    @IBOutlet weak var beerDiscusstionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getRecommendBeer()
    }

    @IBAction func tapRecommendBeer(_ sender: UIButton) {
        getRecommendBeer()
    }
    
    func getRecommendBeer() {
        NetworkService.shared.request(endpoint: BeerAPI.getRandomBeer, responseType: [Beer].self) { result in
            switch result {
            case .success(let success):
                let success = success.first!
                self.beerImage.getImageFromUrl(url: success.image_url)
                self.beerLabel.text = success.name
                self.beerDiscusstionLabel.text = success.description
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
