//
//  HomeViewModel.swift
//  MVVMTutorial
//
//  Created by Conestoga on 2024-01-15.
//

import Foundation


final class HomeViewModel{
    
    @Published var welcomeMessage : String?
    
    func getLoggedInUser(){
        let user = NetworkService.shared.getLoggedInUser()
        
        self.welcomeMessage = "Hello \(user?.firstName ?? "-") \(user?.lastName ?? "-")"
    }
}
