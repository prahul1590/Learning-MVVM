//
//  LoginViewModel.swift
//  MVVMTutorial
//
//  Created by Conestoga on 2024-01-15.
//

import Foundation

final class LoginViewModel{
    
    @Published var error: String?
    
    func login(email: String, password: String){
        NetworkService.shared.login(email: email, password: password) {[weak self] success in
            self?.error = success ? nil : "Invalid Credentials"
        }
    }
}
