//
//  MessageBubble.swift
//  franChat
//
//  Created by Agustin Franchetti on 10/08/2022.
//

import SwiftUI

struct MessageBubble: View {
    var message: Message
    @State private var showTime = false
    
    var body: some View {
        VStack(alignment: message.recieved ? .leading : .trailing){
            HStack{
                Text(message.text)
                    .padding()
                    .background(message.recieved ?
                        Color("Gray"):Color("Peach")
                    )
                    .cornerRadius(30, corners: message.recieved ? [.topLeft, .topRight, .bottomRight] : [.topLeft, .topRight, .bottomLeft])
            }
            .frame(maxWidth:300, alignment: message.recieved ? .leading : .trailing)
            .onTapGesture {
                showTime.toggle()
            }
            if showTime{
                Text("\(message.timestamp.formatted(.dateTime.hour().minute()))")
                    .font(.caption2)
                    .foregroundColor(.gray)
                    .padding(message.recieved ? .leading : .trailing, 25)
            }
        }
        .frame(maxWidth: .infinity, alignment: message.recieved ? .leading : .trailing)
        .padding(message.recieved ? .leading : .trailing)
    }
}

struct MessageBubble_Previews: PreviewProvider {
    static var previews: some View {
        MessageBubble(message: Message.sampleData[0])
    }
}
