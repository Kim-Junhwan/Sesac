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
    let recomendedCode = Observable(value: "")
    let validEmail = Observable(value: false)
    let validPassword = Observable(value: false)
    let validRecomended = Observable(value: false)
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
        
        recomendedCode.subscribe { code in
            self.validRecomended.value = self.checkRecomededCode(code: code)
        }
    }
    
    private func checkEmail(email: String) -> Bool {
        return email.contains("@")
    }
    
    private func checkPassword(password: String) -> Bool {
        if password.count >= 6 && password.count <= 10 {
            return true
        }
        return false
    }
    
    private func checkRecomededCode(code: String) -> Bool {
        if code.count != 6 {
            return false
        }
        for item in Array(code) {
            if !item.isNumber {
                return false
            }
        }
        return true
    }
    
    private func checkCanRegister() -> Bool {
        return validEmail.value && validPassword.value && validRecomended.value
    }
}
