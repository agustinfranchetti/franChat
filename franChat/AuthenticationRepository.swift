//
//  AuthenticationRepository.swift
//  franChat
//
//  Created by Agustin Franchetti on 12/08/2022.
//

import Foundation

final class AuthenticationRepository {
    private let authenticationFirebaseDatasource : AuthenticationFirebaseDatasource
    
    init(authenticationFirebaseDatasource: AuthenticationFirebaseDatasource = AuthenticationFirebaseDatasource()) {
        self.authenticationFirebaseDatasource = authenticationFirebaseDatasource
    }
    
    func getCurrentUser() -> User? {
        authenticationFirebaseDatasource.getCurrentUser()
    }
    
    func createUser(email: String, password: String, completionBlock: @escaping (Result<User, Error>) -> Void) {
        authenticationFirebaseDatasource.createUser(email: email, password: password, completionBlock: completionBlock)
    }
    
}
