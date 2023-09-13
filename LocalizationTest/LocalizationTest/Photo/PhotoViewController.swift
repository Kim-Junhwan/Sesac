//
//  PhotoViewController.swift
//  LocalizationTest
//
//  Created by JunHwan Kim on 2023/09/12.
//

import UIKit

class PhotoViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    let viewModel = PhotoViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.keyboardDismissMode = .onDrag
        tableView.rowHeight = 100
        searchBar.delegate = self
        tableView.register(.init(nibName: "PhotoTableViewCell", bundle: nil), forCellReuseIdentifier: "reuseCell")
        viewModel.list.subscribe { _ in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

}

extension PhotoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.list.value.results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseCell") as! PhotoTableViewCell
        cell.configureCell(photo: (viewModel.list.value.results?[indexPath.row])!)
        return cell
    }
}

extension PhotoViewController: UISearchBarDelegate {
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else { return }
        viewModel.fetchPhoto(query: searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
}
