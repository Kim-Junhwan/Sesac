//
//  ViewController.swift
//  Beer
//
//  Created by JunHwan Kim on 2023/08/08.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    
    var beerList: [Beer] = []

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: BeerTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: BeerTableViewCell.identifier)
        tableView.rowHeight = 110
        fetchBeerList()
    }
    
    func fetchBeerList() {
        let url = "https://api.punkapi.com/v2/beers?page=1&per_page=10"
        AF.request(url, method: .get).validate().response { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let name = json.arrayValue.map { $0["name"].stringValue }
                let imageUrl = json.arrayValue.map { $0["image_url"].stringValue }
                for num in 0..<name.count {
                    self.beerList.append(Beer(name: name[num], image_url: imageUrl[num]))
                    self.tableView.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beerList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BeerTableViewCell.identifier) as? BeerTableViewCell else { return UITableViewCell() }
        cell.configureCell(beer: beerList[indexPath.row])
        return cell
    }
    
    
}

