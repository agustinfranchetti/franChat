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
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
