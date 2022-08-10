//
//  TitleRow.swift
//  franChat
//
//  Created by Agustin Franchetti on 10/08/2022.
//

import SwiftUI

struct TitleRow: View {
    //profile picture
    var imageUrl = URL(string: "https://pbs.twimg.com/profile_images/1378419539344494593/1Yj6FrAr_400x400.jpg")
    var name = "Francho"
    var body: some View {
        HStack(spacing:20) {
            AsyncImage(url: imageUrl){image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width:50, height:50)
                    .cornerRadius(50)
            } placeholder: {
                ProgressView()
            }
            VStack(alignment: .leading){
                Text(name)
                    .font(.title).bold()
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
    }
}

struct TitleRow_Previews: PreviewProvider {
    static var previews: some View {
        TitleRow()
            .background(Color("Peach"))
    }
}
