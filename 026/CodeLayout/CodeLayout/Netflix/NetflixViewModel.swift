//
//  NetflixViewModel.swift
//  CodeLayout
//
//  Created by JunHwan Kim on 2023/09/13.
//

import Foundation

final class NetflixViewModel {
    
    let email = Observable(value: "")
    let passWord = Observable(value: "")
    let validEmail = Observable(value: false)
    let validPassword = Observable(value: false)
    let validRegister = BehaviorObservable(value: false)
    
    init() {
        email.subscribe { inputEmail in
            self.validEmail.value = self.checkEmail(email: inputEmail)
            self.validRegister.value = self.checkCanRegister()
        }
        
        passWord.subscribe { inputPassword in
            self.validPassword.value = self.checkPassword(password: inputPassword)
            self.validRegister.value = self.checkCanRegister()
        }
    }
    
    private func checkEmail(email: String) -> Bool {
        if email.count > 5 {
            return true
        }
        return false
    }
    
    private func checkPassword(password: String) -> Bool {
        if password.count > 5 {
            return true
        }
        return false
    }
    
    private func checkCanRegister() -> Bool {
        return validEmail.value && validPassword.value
    }
}
