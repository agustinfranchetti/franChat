//
//  ChatPreview.swift
//  franChat
//
//  Created by Agustin Franchetti on 18/08/2022.
//

import SwiftUI

enum ChatShiftView: String, Identifiable {
    case chat
    
    var id: String{
        return rawValue
    }
}

struct ChatPreview: View {
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    @State private var chatShiftView : ChatShiftView?
    var chat: Chat
    var body: some View {
        let currentUser = authenticationViewModel.user?.email
        let chatContact = currentUser == chat.user1 ? chat.user2 : chat.user1
        let atIndex = chatContact.firstIndex(of: "@")!
        HStack{
            VStack(alignment: .leading){
                Text(chatContact.prefix(upTo: atIndex))
                    .font(.title3).bold()
                Text(chatContact)
                    .font(.caption)
            }
            .padding()
            .sheet(item: $chatShiftView) { sheet in
                switch sheet {
                case .chat:
                    MessageView(authenticationViewModel: authenticationViewModel)
                }
            }
        }
        .frame(maxWidth: .infinity,alignment: .leading)
    }
}

struct ChatPreview_Previews: PreviewProvider {
    static var previews: some View {
        ChatPreview(authenticationViewModel: AuthenticationViewModel(), chat: Chat(id: "123", user1: "agustinfranchetti@gmail.com", user2: "marianochavez@gmail.com"))
            .background(Color("Gray"))
    }
}
