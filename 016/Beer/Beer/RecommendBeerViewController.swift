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
        let url = "https://api.punkapi.com/v2/beers/random"
            AF.request(url, method: .get).response { response in
                switch response.result {
                case .success(let value):
                    let json = JSON(value).arrayValue[0]
                    self.beerLabel.text = json["name"].stringValue
                    self.beerImage.getImageFromUrl(url: json["image_url"].stringValue)
                    self.beerDiscusstionLabel.text = json["description"].stringValue
                case .failure(let error):
                    print(error)
                }
            }
    }
}
