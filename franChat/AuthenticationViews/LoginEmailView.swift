//
//  LoginEmailView.swift
//  franChat
//
//  Created by Agustin Franchetti on 12/08/2022.
//

import SwiftUI

struct LoginEmailView: View {
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    @State var textFieldEmail = ""
    @State var textFieldPassword = ""
    var body: some View {
        
        VStack {
            DismissView()
            VStack {
                Group {
                    Text("👋🏻 Welcome back to")
                    Text("franChat")
                        .bold()
                }
                .padding(.horizontal, 10)
                .multilineTextAlignment(.center)
                .font(.largeTitle)
                
                Text("Login to start chatting\nwith your friends!")
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
                        //authenticationViewModel.loginUser(email: textFieldEmail, password: textFieldPassword)
                        print("hola")
                    } label: {
                        Label("Login", systemImage: "person.fill")
                    }
                    .controlSize(.large)
                    .buttonStyle(.borderedProminent)
                    .padding(.top, 30)
                }
                .textFieldStyle(.roundedBorder)
                .padding(.horizontal,50)
                Spacer()
            }
            .padding(.top, 80)
        }
    }
}

struct LoginEmailView_Previews: PreviewProvider {
    static var previews: some View {
        LoginEmailView(authenticationViewModel: AuthenticationViewModel())
    }
}
