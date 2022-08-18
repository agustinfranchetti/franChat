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
    var sender: String
    var receiver: String
    var timestamp: Date
}

