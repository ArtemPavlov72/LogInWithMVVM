//
//  LoginViewModel.swift
//  LogInWithMVVM
//
//  Created by Artem Pavlov on 18.05.2022.
//

import Foundation

protocol LoginViewModelProtocol {
    var personName: String {get}
    var personSurname: String {get}
    init(person: Person)
}

class LoginViewModel: LoginViewModelProtocol {
    
    var personName: String {
        person.name
    }
    
    var personSurname: String {
        person.surname
    }
    
    private let person: Person
    
    required init(person: Person) {
        self.person = person
    }
}
