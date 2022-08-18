//
//  MessageInputField.swift
//  franChat
//
//  Created by Agustin Franchetti on 10/08/2022.
//

import SwiftUI

struct MessageInputField: View {
    @EnvironmentObject var messagesManager: MessagesManager
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    
    @State private var message = ""
    var body: some View {
        let currentUser = authenticationViewModel.user?.email
        HStack{
            CustomTextField(placeholder: Text("Type a message..."), text: $message)
            Button{
                messagesManager.sendMessage(text: message, sender: currentUser!, receiver: "marianochavez@gmail.com")
                message = ""
            } label: {
                Image(systemName: "paperplane.fill")
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Color("Peach"))
                    .cornerRadius(50)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 10)
        .background(Color("Gray"))
        .cornerRadius(50)
        .padding(10)
    }
}

struct MessageInputField_Previews: PreviewProvider {
    static var previews: some View {
        MessageInputField(authenticationViewModel: AuthenticationViewModel())
            .environmentObject(MessagesManager())
    }
}

struct CustomTextField: View {
    var placeholder: Text
    //Binding to pass it to MessageInputFiled, since it's another view
    @Binding var text: String
    var editingChanged: (Bool) -> () = {_ in}
    var commit: () -> () = {}
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {
                placeholder
                    .opacity(0.5)
            }
             TextField(
               "",
               text: $text,
               onEditingChanged: editingChanged,
               onCommit: commit
             )
        }
    }
}
