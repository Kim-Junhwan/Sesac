//
//  SearchCollectionViewController.swift
//  MyDiary
//
//  Created by JunHwan Kim on 2023/07/31.
//

import UIKit

class SearchCollectionViewController: UICollectionViewController {
    
    let searchbar = UISearchBar()
    let list = ["iOS","토끼","지렁이","프레리독","몽구스","문어","딱새", "사자","호랑이"]
    var searchList: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchbar.placeholder = "검색어를 입력해주세요"
        searchbar.showsCancelButton = true
        searchbar.delegate = self
        navigationItem.titleView = searchbar
        collectionView.register(UINib(nibName: SearchCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: SearchCollectionViewCell.identifier)
        let flowlayout = UICollectionViewFlowLayout()
        collectionView.collectionViewLayout = flowlayout
        flowlayout.collectionView?.delegate = self
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchList.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCollectionViewCell.identifier, for: indexPath) as? SearchCollectionViewCell else { return SearchCollectionViewCell() }
        cell.backgroundColor = .blue
        cell.contentLabel.text = "\(searchList[indexPath.row])"
        return cell
    }
    
    
}

extension SearchCollectionViewController: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchbar.text?.removeAll()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchList = list.filter({ str in
            str.contains(searchText)
        })
        collectionView.reloadData()
    }
}
