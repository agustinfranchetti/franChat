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
        let currentUser = authenticationViewModel.user?.email
        let chatContact = currentUser == chat.user1 ? chat.user2 : chat.user1
        //let atIndex = chatContact.firstIndex(of: "@")
        let chatId = chat.id
        let messagesManager = MessagesManager()
        let _ = messagesManager.getMessages(chatID: chatId)
        NavigationLink(destination : MessageView(authenticationViewModel: authenticationViewModel, messagesManager: messagesManager, chatId: chatId, chatContact: chatContact)) {
            HStack{
                VStack(alignment: .leading){
                    //Text(chatContact.prefix(upTo: atIndex!))
                    Text(chatContact)
                        .font(.title3).bold()
                    Text(chatContact)
                        .font(.caption)
                }
                .padding()
            }
            .frame(maxWidth: .infinity,alignment: .leading)
        }
        .foregroundColor(.black)
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct ChatPreview_Previews: PreviewProvider {
    static var previews: some View {
        ChatPreview(authenticationViewModel: AuthenticationViewModel(), chat: Chat(id: "123", user1: "agustinfranchetti@gmail.com", user2: "marianochavez@gmail.com"))
            .background(Color("Gray"))
    }
}
