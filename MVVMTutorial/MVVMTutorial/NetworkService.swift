//
//  NetworkService.swift
//  MVVMTutorial
//
//  Created by Conestoga on 2024-01-15.
//

import Foundation


final class NetworkService{
    static let shared = NetworkService()
    private var user : User?
    
    private init(){}
    
    func login(email: String, password: String, completion: @escaping(Bool) -> Void){
        DispatchQueue.main.asyncAfter(deadline: .now()+2){
            [weak self] in
            if email == "test@test.com" && password == "password"{
                
                self?.user = User(firstName: "Rahul", lastName: "Patel", email: "test@test.com", age: 33)
                completion(true)
            }else{
                self?.user = nil
                completion(false)
            }
        }
    }
    
    func getLoggedInUser() -> User? {
        return user
    }
}
