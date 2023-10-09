//
//  AuthenticationFirebaseDatasource.swift
//  SaveLink
//
//  Created by Juan Carlos Hernandez Castillo on 7/10/23.
//

import Foundation
import FirebaseAuth

struct User {
    let email: String
}

final class AuthenticationFirebaseDatasource {
    
    private let facebookAuthentication = FacebookAuthentication()
    
    func getCurrentUser() -> User? {
        guard let email = Auth.auth().currentUser?.email else {
            return nil
        }
        return .init(email: email)
    }
    
    func createNewUser(email: String, password: String, completion: @escaping(Result<User, Error>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { authDataResult, error in
            if let error = error {
                print("Error creating user \(error.localizedDescription)")
                completion(.failure(error))
                return
            }
            
            let email = authDataResult?.user.email ?? "No email"
            print("New user created with info \(email)")
            completion(.success(.init(email: email)))
        }
    }
    
    func login(email: String, password: String, completion: @escaping(Result<User, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { authDataResult, error in
            if let error = error {
                print("Login error \(error.localizedDescription)")
                completion(.failure(error))
                return
            }
            
            let email = authDataResult?.user.email ?? "No email"
            print("Login user with info \(email)")
            completion(.success(.init(email: email)))
        }
    }
    
    func logout() throws {
        try Auth.auth().signOut()
    }
    
    // MARK: - Facebook auth
    func loginWithFacebook(completion: @escaping(Result<User, Error>) -> Void) {
        facebookAuthentication.loginFacebook { result in
            switch result {
            case .success(let token):
                let credential = FacebookAuthProvider.credential(withAccessToken: token)
                Auth.auth().signIn(with: credential) { authDataResult, error in
                    if let error = error {
                        print("Error creating new user from facebook \(error.localizedDescription)")
                        completion(.failure(error))
                        return
                    }
                    
                    let email = authDataResult?.user.email ?? "No email"
                    print("New user created with info \(email)")
                    completion(.success(.init(email: email)))
                }
            case .failure(let error):
                print("Error signIn from facebook \(error.localizedDescription)")
            }
        }
    }
}
