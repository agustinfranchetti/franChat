//
//  ChatPreview.swift
//  franChat
//
//  Created by Agustin Franchetti on 18/08/2022.
//

import SwiftUI

struct ChatPreview: View {
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    var chat: Chat
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ChatPreview_Previews: PreviewProvider {
    static var previews: some View {
        ChatPreview(authenticationViewModel: AuthenticationViewModel(), chat: Chat(id: "123", user1: "agustinfranchetti@gmail.com", user2: "marianochavez@gmail.com"))
    }
}
