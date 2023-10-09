//
//  AuthenticationRepository.swift
//  SaveLink
//
//  Created by Juan Carlos Hernandez Castillo on 7/10/23.
//

import Foundation

final class AuthenticationRepository {
    private let authenticationFirebaseDatasource: AuthenticationFirebaseDatasource
    
    init(authenticationFirebaseDatasource: AuthenticationFirebaseDatasource = AuthenticationFirebaseDatasource()) {
        self.authenticationFirebaseDatasource = authenticationFirebaseDatasource
    }
    
    func createNewUser(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        authenticationFirebaseDatasource.createNewUser(email: email, password: password, completion: completion)
    }
    
    func login(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        authenticationFirebaseDatasource.login(email: email, password: password, completion: completion)
    }
    
    func getCurrentUser() -> User? {
        authenticationFirebaseDatasource.getCurrentUser()
    }
    
    func logout() throws {
        try authenticationFirebaseDatasource.logout()
    }
    
    // MARK: - Facebook auth
    
    func loginFacebook(completion: @escaping (Result<User, Error>) -> Void) {
        authenticationFirebaseDatasource.loginWithFacebook(completion: completion)
    }
}
