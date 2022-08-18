//
//  AuthenticationFirebaseDatasource.swift
//  franChat
//
//  Created by Agustin Franchetti on 12/08/2022.
//

import Foundation
import FirebaseAuth

struct User {
    let email: String
}

final class AuthenticationFirebaseDatasource {
    func getCurrentUser() -> User? {
        guard let email = Auth.auth().currentUser?.email else {
            return nil
        }
        return .init(email:email)
    }
    
    func createUser(email: String, password: String, completionBlock: @escaping (Result<User, Error>) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { authDataResult, error in
            if let error = error {
                print("Error creating a new user \(error.localizedDescription)")
                completionBlock(.failure(error))
                return
            }
            let email = authDataResult?.user.email ?? "No email"
            print("New user created with email \(email)")
            completionBlock(.success(.init(email: email)))
        }
    }
    
    func logInUser(email: String, password: String, completionBlock: @escaping (Result<User, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { authDataResult, error in
            if let error = error {
                print("Error logging in user \(error.localizedDescription)")
                completionBlock(.failure(error))
                return
            }
            let email = authDataResult?.user.email ?? "No email"
            print("Logged in user with email \(email)")
            completionBlock(.success(.init(email: email)))
        }
    }
    
    func logOut() throws {
        try Auth.auth().signOut()
    }
}
