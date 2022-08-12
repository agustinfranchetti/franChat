//
//  AuthenticationView.swift
//  franChat
//
//  Created by Agustin Franchetti on 12/08/2022.
//

import SwiftUI

enum AuthenticationShiftView: String, Identifiable {
    case register
    case login
    
    var id: String{
        return rawValue
    }
}

struct AuthenticationView: View {
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    @State private var authenticationShiftView : AuthenticationShiftView?
    var body: some View {
        VStack{
            Image("franChat-icon")
                .resizable()
                .frame(width: 200, height: 200)
                .cornerRadius(47)
            VStack {
                Button {
                    authenticationShiftView = .login
                } label: {
                    Label("Login using e-mail", systemImage: "envelope.fill")
                }
            }
            .controlSize(.large)
            .buttonStyle(.borderedProminent)
            .padding(.top, 60)
            Spacer()
            VStack {
                Text("Do not have an account?")
                Button {
                    authenticationShiftView = .register
                } label: {
                    Text("Register")
                        .underline()
                }
                
            }
        }
        .padding(.top, 80)
        .sheet(item: $authenticationShiftView) { sheet in
            switch sheet {
            case .register:
                RegisterEmailView(authenticationViewModel: authenticationViewModel)
            case .login :
                LoginEmailView(authenticationViewModel: authenticationViewModel)
            }
        }

    }
}

struct AuthenticationView_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationView(authenticationViewModel: AuthenticationViewModel())
    }
}
