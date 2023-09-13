//
//  Observable.swift
//  LocalizationTest
//
//  Created by JunHwan Kim on 2023/09/12.
//

import Foundation

class Observable<T> {
    var listener: ((T) -> Void)?
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(value: T) {
        self.value = value
    }
    
    func subscribe(_ completion: @escaping (T) -> Void) {
        listener = completion
    }
}
