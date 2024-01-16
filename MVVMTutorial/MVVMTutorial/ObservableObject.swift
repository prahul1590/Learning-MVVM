//
//  ObservableObject.swift
//  MVVMTutorial
//
//  Created by Conestoga on 2024-01-15.
//

import Foundation
final class ObservableObject <T>{
    var value : T{
        didSet{
            listener?(value)
            
        }
    }
    
    private var listener : ((T) -> Void)?
    
    init(value: T) {
        self.value = value
    }
    
    func bind(_ listener : @escaping(T) -> Void){
        listener(value)
        self.listener = listener
    }
}
