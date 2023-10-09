//
//  FacebookAuthentication.swift
//  SaveLink
//
//  Created by Juan Carlos Hernandez Castillo on 9/10/23.
//

import Foundation
import FacebookLogin

final class FacebookAuthentication {
    let loginManager = LoginManager()
    
    func loginFacebook(completion: @escaping (Result<String, Error>) -> Void) {
        loginManager.logIn(permissions: ["email"], from: nil) { loginManagerLoginResult, error in
            if let error = error {
                print("Error login with Facebook \(error.localizedDescription)")
                completion(.failure(error))
            }
            
            let token = loginManagerLoginResult?.token?.tokenString
            completion(.success(token ?? "Empty token"))
        }
    }
}
