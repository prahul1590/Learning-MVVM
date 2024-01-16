//
//  HomeViewController.swift
//  MVVMTutorial
//
//  Created by Conestoga on 2024-01-15.
//

import UIKit
import Combine

class HomeViewController: UIViewController {

    @IBOutlet weak var lblWelcomeMessage: UILabel!
    
    private let viewModel = HomeViewModel()
    
    private var cancallables : Set<AnyCancellable> = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.viewModel.getLoggedInUser()
        
        self.setupBinders()
    }
    
    private func setupBinders(){
   
        self.viewModel.$welcomeMessage.sink { [weak self] message in
            self?.lblWelcomeMessage.text = message
        }.store(in: &cancallables)
    }
    
}
