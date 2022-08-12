//
//  RegisterEmailView.swift
//  franChat
//
//  Created by Agustin Franchetti on 12/08/2022.
//

import SwiftUI

struct RegisterEmailView: View {
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    @State var textFieldEmail = ""
    @State var textFieldPassword = ""
    var body: some View {
        VStack {
            DismissView()
            VStack {
                    Group {
                        Text("👋🏻 Welcome to")
                        Text("franChat")
                            .bold()
                    }
                    .padding(.horizontal, 10)
                    .multilineTextAlignment(.center)
                    .font(.largeTitle)
                    
                    Text("Create an account to start chatting\nwith your friends!")
                        .bold()
                        .padding(.vertical, 10)
                        .multilineTextAlignment(.center)
                    
                    Group {
                        VStack {
                        TextField("e-mail address", text: $textFieldEmail)
                        TextField("password", text: $textFieldPassword)
                        }
                        .padding(.top, 30)
                        
                        Button {
                            authenticationViewModel.createuser(email: textFieldEmail, password: textFieldPassword)
                        } label: {
                            Label("Register", systemImage: "person.fill")
                        }
                        .controlSize(.large)
                        .buttonStyle(.borderedProminent)
                        .padding(.top, 30)
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


struct RegisterEmailView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterEmailView(authenticationViewModel: AuthenticationViewModel())
    }
}
