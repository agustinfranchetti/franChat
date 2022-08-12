//
//  RegisterEmailView.swift
//  franChat
//
//  Created by Agustin Franchetti on 12/08/2022.
//

import SwiftUI

struct RegisterEmailView: View {
    @State var textFieldEmail = ""
    @State var textFieldPassword = ""
    var body: some View {
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
                        print("register")
                    } label: {
                        Label("Register", systemImage: "person.fill")
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


struct RegisterEmailView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterEmailView()
    }
}
