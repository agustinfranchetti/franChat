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
    var received: Bool
    var timestamp: Date
}

extension Message {
    static let sampleData: [Message] =
    [
        Message(id: "1", text: "Perri", received: true, timestamp: Date()),
        Message(id: "2", text: "Como va?", received: true, timestamp: Date()),
        Message(id: "3", text: "Que onda mano. Bien, y vos?", received: false, timestamp: Date()),
    ]
}

