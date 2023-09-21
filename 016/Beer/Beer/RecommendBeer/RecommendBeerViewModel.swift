//
//  RecommendBeerViewModel.swift
//  Beer
//
//  Created by JunHwan Kim on 2023/09/20.
//

import Foundation

final class RecommendBeerViewModel {
    
    var beer: Observable<Beer> = Observable<Beer>(value: .init(name: "", image_url: "", description: ""))
    
    func fetchRecommendBeer() {
        NetworkService.shared.request(endpoint: BeerAPI.getRandomBeer, responseType: [Beer].self) { [weak self] result in
            switch result {
            case .success(let success):
                guard let success = success.first else { return }
                self?.beer.value = success
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
