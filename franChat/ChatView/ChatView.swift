//
//  ChatView.swift
//  franChat
//
//  Created by Agustin Franchetti on 18/08/2022.
//

import SwiftUI

struct ChatView: View {
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    @StateObject var chatsManager = ChatsManager()
    var body: some View {
        NavigationView {
            VStack {
                VStack{
                    TitleRow(authenticationViewModel: authenticationViewModel)
                    ScrollViewReader{ proxy in
                        //get last id
                        ScrollView{
                            ForEach(chatsManager.chats, id: \.id) { chat in
                                ChatPreview(authenticationViewModel: authenticationViewModel, chat: chat)
                            }
                        }
                        .padding(.top, 10)
                        .background(.white)
                    }
                }
                .background(Color("Peach"))
                Spacer()
                NewChatButtonView(authenticationViewModel: authenticationViewModel, chatsManager: chatsManager, chat: Chat(id: "", user1: "", user2: ""))
            }
            
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
    }
}


struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(authenticationViewModel: AuthenticationViewModel())
    }
}
