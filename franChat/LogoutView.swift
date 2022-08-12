//
//  LogoutView.swift
//  franChat
//
//  Created by Agustin Franchetti on 12/08/2022.
//

import SwiftUI

struct LogoutView: View {
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    var body: some View {
            VStack {
                HStack {
                    Text("Account:")
                    Text(authenticationViewModel.user?.email ?? "unknown")
                }
            }
                Button {
                    authenticationViewModel.logOut()
                } label: {
                    Label("Log Out", systemImage: "person.fill.badge.minus")
                }
                .padding()
        }
    }

struct LogoutView_Previews: PreviewProvider {
    static var previews: some View {
        LogoutView(authenticationViewModel: AuthenticationViewModel())
    }
}
