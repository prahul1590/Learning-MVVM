//
//  HomeViewController.swift
//  MVVMTutorial
//
//  Created by Conestoga on 2024-01-15.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var lblWelcomeMessage: UILabel!
    
    private let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.viewModel.getLoggedInUser()
        
        self.setupBinders()
    }
    
    private func setupBinders(){
        viewModel.welcomeMessage.bind { [weak self] message in
            self?.lblWelcomeMessage.text = message
        }
    }
    
}
