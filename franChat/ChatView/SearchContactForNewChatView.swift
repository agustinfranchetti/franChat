//
//  SearchContactForNewChatView.swift
//  franChat
//
//  Created by Agustin Franchetti on 19/08/2022.
//

import SwiftUI

struct SearchContactForNewChatView: View {
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    @StateObject var chatsManager : ChatsManager
    @Binding var isPresented: Bool
    @State var textFieldEmail = ""
    var body: some View {
        let currentUser = authenticationViewModel.user!.email
        VStack {
            DismissView()
            VStack {
                    Group {
                        Text("Who do you want to")
                        Text("chat with?")
                    }
                    .padding(.horizontal, 10)
                    .multilineTextAlignment(.center)
                    .font(.largeTitle)
                    
                    Text("Type in your friend's email")
                        .bold()
                        .padding(.vertical, 10)
                        .multilineTextAlignment(.center)
                    
                    Group {
                        TextField("e-mail address", text: $textFieldEmail)
                            .padding(.top, 10)
                        
                        Button {
                            chatsManager.startChat(user1: currentUser, user2: textFieldEmail)
                            isPresented = false
                        } label: {
                            Label("Start Chat", systemImage: "pencil")
                        }
                        .controlSize(.large)
                        .buttonStyle(.borderedProminent)
                        .padding(.top, 20)
                        if let errorMessage = authenticationViewModel.errorMessage {
                            Text(errorMessage)
                                .bold()
                                .font(.body)
                                .foregroundColor(.red)
                                .padding(.top, 20)
                        }
                    }
                    .textFieldStyle(.roundedBorder)
                    .padding(.horizontal,50)
                    Spacer()
                }
            .padding(.top, 80)
        }
        }
    
    }




