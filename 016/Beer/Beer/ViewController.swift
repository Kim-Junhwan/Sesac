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
        NetworkService.shared.request(endpoint: BeerAPI.getBeerList, responseType: [Beer].self) { result in
            switch result {
            case .success(let success):
                self.beerList = success
                self.tableView.reloadData()
            case .failure(let failure):
                print(failure)
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

