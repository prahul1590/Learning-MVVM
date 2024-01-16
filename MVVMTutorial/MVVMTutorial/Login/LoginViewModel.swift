//
//  LoginViewModel.swift
//  MVVMTutorial
//
//  Created by Conestoga on 2024-01-15.
//

import Foundation

final class LoginViewModel{
    
    var error: ObservableObject<String?> = ObservableObject(value: "")
    
    func login(email: String, password: String){
        NetworkService.shared.login(email: email, password: password) {[weak self] success in
            self?.error.value = success ? nil : "Invalid Credentials"
        }
    }
}
