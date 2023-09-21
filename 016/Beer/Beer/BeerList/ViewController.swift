//
//  ViewController.swift
//  Beer
//
//  Created by JunHwan Kim on 2023/08/08.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let viewModel: BeerListViewModel = BeerListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: BeerTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: BeerTableViewCell.identifier)
        tableView.rowHeight = 110
        bind()
        viewModel.fetchBeerList()
    }
    
    func bind() {
        viewModel.beerList.subscribe { _ in
            self.tableView.reloadData()
        }
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.beerList.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BeerTableViewCell.identifier) as? BeerTableViewCell else { return UITableViewCell() }
        cell.configureCell(beer: viewModel.beerList.value[indexPath.row])
        return cell
    }
    
    
}

