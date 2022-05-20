//
//  ViewController.swift
//  LogInWithMVVM
//
//  Created by Artem Pavlov on 18.05.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    //MARK: - IB Outlets
    @IBOutlet var greetingLabel: UILabel!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var surnameTextField: UITextField!
    
    //MARK: - Private Properties
    private var viewModel: LoginViewModelProtocol! {
        didSet {
            viewModel.viewModelDidChange = { [unowned self] viewModel in
                self.greetingLabel.text = viewModel.greetingText
            }
        }
    }
    
    // MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IB Actions
    @IBAction func loginPressed() {
        viewModel = LoginViewModel(
            personName: nameTextField.text ?? "",
            personSurname: surnameTextField.text ?? ""
        )
        viewModel.showGreeting()
    }
}

