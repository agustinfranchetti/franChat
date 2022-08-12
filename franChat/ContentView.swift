//
//  ContentView.swift
//  franChat
//
//  Created by Agustin Franchetti on 10/08/2022.
//

import SwiftUI



struct ContentView: View {
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    @StateObject var messagesManager = MessagesManager()
    var body: some View {
            VStack {
                VStack{
                    TitleRow(authenticationViewModel: authenticationViewModel)
                    ScrollViewReader{ proxy in
                        //get last id
                        ScrollView{
                            ForEach(messagesManager.messages, id: \.id) { message in
                                MessageBubble(message: message)
                            }
                        }
                        .padding(.top, 10)
                        .background(.white)
                        .cornerRadius(30, corners: [.topLeft, .topRight])
                        .onChange(of: messagesManager.lastMessageId) { lastId in
                            withAnimation{
                                proxy.scrollTo(lastId, anchor: .bottom)
                            }
                        }
                    }
                }
                .background(Color("Peach"))
                MessageInputField()
                    .environmentObject(messagesManager)
            }
            
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(authenticationViewModel: AuthenticationViewModel())
    }
}
