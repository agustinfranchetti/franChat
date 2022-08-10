//
//  ContentView.swift
//  franChat
//
//  Created by Agustin Franchetti on 10/08/2022.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            VStack{
                TitleRow()
                ScrollView{
                    ForEach(Message.sampleData.indices) { index in
                        MessageBubble(message: Message.sampleData[index])
                    }
                }
                .padding(.top, 10)
                .background(.white)
                .cornerRadius(30, corners: [.topLeft, .topRight])
            }
            .background(Color("Peach"))
            MessageInputField()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
