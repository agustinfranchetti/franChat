//
//  NewChatButtonView.swift
//  franChat
//
//  Created by Agustin Franchetti on 19/08/2022.
//

import SwiftUI

struct NewChatButtonView: View {
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    @StateObject var chatsManager : ChatsManager
    @State private var showingNewChat = false
    var chat: Chat
    var body: some View {
        HStack {
            Spacer()
            Button {
                showingNewChat = true
            } label: {
                Image(systemName: "plus.circle.fill")
                    .foregroundColor(Color("Peach"))
                    .font(.system(size: 60, weight: .bold))
        }
            .padding(.trailing, 40)
            
        }
        .sheet(isPresented: $showingNewChat) {
            SearchContactForNewChatView(authenticationViewModel: authenticationViewModel, chatsManager: chatsManager, isPresented: $showingNewChat)
                
        }
    }
}

struct NewChatButtonView_Previews: PreviewProvider {
    static var previews: some View {
        NewChatButtonView(authenticationViewModel: AuthenticationViewModel(), chatsManager: ChatsManager(), chat: Chat(id: "123", user1: "agustinfranchetti@gmail.com", user2: "marianochavez@gmail.com"))
    }
}
