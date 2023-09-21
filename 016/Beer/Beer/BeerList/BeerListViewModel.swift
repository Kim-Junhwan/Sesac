//
//  BeerListViewModel.swift
//  Beer
//
//  Created by JunHwan Kim on 2023/09/21.
//

import Foundation

final class BeerListViewModel {
    
    let beerList: Observable<[Beer]> = Observable<[Beer]>(value: [])
    
    func fetchBeerList() {
        NetworkService.shared.request(endpoint: BeerAPI.getBeerList, responseType: [Beer].self) { result in
            switch result {
            case .success(let success):
                self.beerList.value = success
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
