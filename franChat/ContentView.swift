//
//  ContentView.swift
//  franChat
//
//  Created by Agustin Franchetti on 10/08/2022.
//

import SwiftUI

struct ContentView: View {
    
    var sampleMessageArray = ["Perri", "como va?", "Hola mano, todo bom. Eu vocem?"]
    var body: some View {
        VStack{
            TitleRow()
            ScrollView{
                ForEach(sampleMessageArray.indices) { index in
                    MessageBubble(message: Message.sampleData[index])
                }
            }
            .padding(.top, 10)
            .background(.white)
        }
        .background(Color("Peach"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
