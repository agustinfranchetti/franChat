//
//  franChatApp.swift
//  franChat
//
//  Created by Agustin Franchetti on 10/08/2022.
//

import SwiftUI
import Firebase

@main
struct franChatApp: App {
    init() {
        FirebaseApp.configure()
    }
    @StateObject var authenticationViewModel = AuthenticationViewModel()
    var body: some Scene {
        WindowGroup {
            if let _ = authenticationViewModel.user {
                ContentView(authenticationViewModel: authenticationViewModel)
            } else {
                AuthenticationView(authenticationViewModel: authenticationViewModel)
            }
            
        }
    }
}
