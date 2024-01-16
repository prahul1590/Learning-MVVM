//
//  HomeViewModel.swift
//  MVVMTutorial
//
//  Created by Conestoga on 2024-01-15.
//

import Foundation


final class HomeViewModel{
    
    var welcomeMessage : ObservableObject<String?> = ObservableObject(value: nil)
    
    func getLoggedInUser(){
        let user = NetworkService.shared.getLoggedInUser()
        
        self.welcomeMessage.value = "Hello \(user?.firstName ?? "-") \(user?.lastName ?? "-")"
    }
}
