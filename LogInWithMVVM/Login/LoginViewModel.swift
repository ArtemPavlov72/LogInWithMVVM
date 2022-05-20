//
//  LoginViewModel.swift
//  LogInWithMVVM
//
//  Created by Artem Pavlov on 18.05.2022.
//

import Foundation

protocol LoginViewModelProtocol {
    var greetingText: String? {get}
    var viewModelDidChange: ((LoginViewModelProtocol) -> Void)? {get set}
    init(personName: String, personSurname: String)
    func showGreeting()
}

class LoginViewModel: LoginViewModelProtocol {
    
    //MARK: - Private Properties
    private var personName: String
    private var personSurname: String
    
    //MARK: - LoginViewModel init
    var greetingText: String? {
        didSet {
            viewModelDidChange?(self)
        }
    }
    
    var viewModelDidChange: ((LoginViewModelProtocol) -> Void)?
    
    required init(personName: String, personSurname: String) {
        self.personName = personName
        self.personSurname = personSurname
    }
    
    func showGreeting() {
        let person = getPerson()
        greetingText = "Hello, \(person.name) \(person.surname)!"
    }
    
    //MARK: - Private Methods
    private func getPerson() -> Person {
        let person = Person(name: personName, surname: personSurname)
        return person
    }
}
