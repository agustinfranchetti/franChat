//
//  AuthenticationViewModel.swift
//  franChat
//
//  Created by Agustin Franchetti on 12/08/2022.
//

import Foundation

final class AuthenticationViewModel: ObservableObject {
    @Published var user : User?
    @Published var errorMessage: String?
    private let authenticationRepository : AuthenticationRepository
    
    init(authenticationRepository: AuthenticationRepository = AuthenticationRepository()) {
        self.authenticationRepository = authenticationRepository
        getCurrentUser()
    }
    
    func getCurrentUser(){
        self.user = authenticationRepository.getCurrentUser()
    }
    
    func createuser(email: String, password: String) {
        authenticationRepository.createUser(email: email, password: password){ [weak self] result in
            switch result {
            case .success(let user):
                self?.user = user
            case .failure(let error):
                self?.errorMessage = error.localizedDescription
        }
}    }
}
