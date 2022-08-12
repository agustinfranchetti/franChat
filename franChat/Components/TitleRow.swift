//
//  TitleRow.swift
//  franChat
//
//  Created by Agustin Franchetti on 10/08/2022.
//

import SwiftUI

enum MainScreenShiftView: String, Identifiable {
    case logout
    
    var id: String{
        return rawValue
    }
}

struct TitleRow: View {
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    @State private var mainScreenShiftView : MainScreenShiftView?
    //profile picture
    var imageUrl = URL(string: "https://pbs.twimg.com/profile_images/1378419539344494593/1Yj6FrAr_400x400.jpg")
    var body: some View {
        HStack(spacing:20) {
            Button{
                mainScreenShiftView = .logout
            } label: {
                AsyncImage(url: imageUrl){image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width:50, height:50)
                        .cornerRadius(50)
                } placeholder: {
                    ProgressView()
                }
            }
            VStack(alignment: .leading){
                Text(authenticationViewModel.user?.email.components(separatedBy: ("@"))[0] ?? "Unknown")
                    .font(.title3).bold()
                Text("online")
                    .font(.caption)
            }
            .frame(maxWidth: .infinity,alignment: .leading)
            Image(systemName: "phone.fill")
                .foregroundColor(.gray)
                .padding(10)
                .background(.white)
                .cornerRadius(50)
        }
        .padding()
        .sheet(item: $mainScreenShiftView) { sheet in
            switch sheet {
            case .logout:
                LogoutView(authenticationViewModel: AuthenticationViewModel())
            }
        }
    }
}

struct TitleRow_Previews: PreviewProvider {
    static var previews: some View {
        TitleRow(authenticationViewModel: AuthenticationViewModel())
            .background(Color("Peach"))
    }
}
