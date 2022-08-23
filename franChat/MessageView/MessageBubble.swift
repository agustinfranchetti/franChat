//
//  MessageBubble.swift
//  franChat
//
//  Created by Agustin Franchetti on 10/08/2022.
//

import SwiftUI

struct MessageBubble: View {
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    @State private var showTime = false
    var message: Message
    
    var body: some View {
        let currentUser = authenticationViewModel.user?.email
        if message.text != "" {
        VStack(alignment: message.sender == currentUser ? .trailing : .leading){
            HStack{
                Text(message.text)
                    .padding()
                    .background(message.sender == currentUser ?
                        Color("Gray"):Color("Peach")
                    )
                    .cornerRadius(25, corners: message.sender == currentUser ? [.topLeft, .topRight, .bottomLeft] : [.topLeft, .topRight, .bottomRight])
            }
            .frame(maxWidth:300, alignment: message.sender == currentUser ? .trailing : .leading)
            .onTapGesture {
                showTime.toggle()
            }
            if showTime{
                Text("\(message.timestamp.formatted(.dateTime.hour().minute()))")
                    .font(.caption2)
                    .foregroundColor(.gray)
                    .padding(message.sender == currentUser ? .trailing : .leading, 25)
            }
        }
        .frame(maxWidth: .infinity, alignment: message.sender == currentUser ? .trailing : .leading)
        .padding(message.sender == currentUser ? .trailing : .leading)
    }
    }
}

struct MessageBubble_Previews: PreviewProvider {
    static var previews: some View {
        MessageBubble(authenticationViewModel: AuthenticationViewModel(), message: Message(id: "123", text: "hola", sender: "agustinfranchetti@gmail.com", receiver: "mariano@gmail.com", timestamp: Date()))
    }
}
