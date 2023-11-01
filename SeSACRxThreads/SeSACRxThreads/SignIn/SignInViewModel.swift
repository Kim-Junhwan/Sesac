//
//  SignInViewModel.swift
//  SeSACRxThreads
//
//  Created by jack on 2023/10/30.
//

import Foundation
import RxCocoa
import RxSwift

class SignInViewModel {
    
    let disposeBag = DisposeBag()
    
    let email: BehaviorRelay<String> = .init(value: "")
    let password: BehaviorRelay<String> = .init(value: "")
    lazy var isEmailCorrectFormat = email.map { !$0.isEmpty && $0.contains { $0 == "@" } }.asObservable()
    
    lazy var canLogin = Observable<Bool>.combineLatest(password, isEmailCorrectFormat) { passwordValue, correctEmail  in
        return !passwordValue.isEmpty && correctEmail
    }
    
}
