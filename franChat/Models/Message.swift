//
//  Message.swift
//  franChat
//
//  Created by Agustin Franchetti on 10/08/2022.
//

import Foundation

struct Message: Identifiable, Codable {
    var id: String
    var text: String
    var recieved: Bool
    var timestamp: Date
}

extension Message {
    static let sampleData: [Message] =
    [
        Message(id: "1", text: "Perri", recieved: true, timestamp: Date()),
        Message(id: "2", text: "Como va?", recieved: true, timestamp: Date()),
        Message(id: "3", text: "Que onda mano. Bien, y vos?", recieved: false, timestamp: Date()),
    ]
}

