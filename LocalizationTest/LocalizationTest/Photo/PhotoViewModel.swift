//
//  PhotoViewModel.swift
//  LocalizationTest
//
//  Created by JunHwan Kim on 2023/09/12.
//

import Foundation

class PhotoViewModel {
    var list = Observable(value: Photo(total: 0, total_pages: 0, results: []))
    
    func fetchPhoto(query: String) {
        APIService.shared.searchPhoto(query: query) { photo in
            guard let photo else { return }
            print(photo)
            self.list.value = photo
        }
    }
}
