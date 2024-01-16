//
//  ViewController.swift
//  MVVMTutorial
//
//  Created by Conestoga on 2024-01-12.
//

import UIKit
import Combine

class LoginViewController: UIViewController {

    @IBOutlet weak var txtUserName: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    private let viewModel = LoginViewModel()
    
    private var cancallables : Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.setupBinders()
    }
    
    private func setupBinders(){
        self.viewModel.$error.sink { [weak self] error in
            if let error = error{
                print(error)
            }else{
                self?.goToHomePage()
            }
        }.store(in: &cancallables)
    }

    private func goToHomePage(){
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        
        present(controller, animated: true)
    }
    
    @IBAction func btnLoginClicked(_ sender: Any) {
        guard let userName = self.txtUserName.text,
              let password = self.txtPassword.text else{
            print("Please enter email and password")
            return
        }
        viewModel.login(email: userName, password: password)
    }
    

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true) 
    }
}

