//
//  ViewController.swift
//  LogInWithMVVM
//
//  Created by Artem Pavlov on 18.05.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var greetingLabel: UILabel!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var surnameTextField: UITextField!
    
    var viewModel: LoginViewModelProtocol! {
        didSet {
            viewModel.viewModelDidChange = { [unowned self] viewModel in
                self.greetingLabel.text = viewModel.greetingText
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginPressed() {
        viewModel = LoginViewModel(
            personName: nameTextField.text ?? "",
            personSurname: surnameTextField.text ?? ""
        )
        viewModel.showGreeting()
    }
}

