//
//  MessagesManager.swift
//  franChat
//
//  Created by Agustin Franchetti on 10/08/2022.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class MessagesManager: ObservableObject {
    @Published private(set) var messages: [Message] = []
    @Published private(set) var lastMessageId = ""
    let db = Firestore.firestore()
    
    init(){
        getMessages()
    }
    
    func getMessages(){
        db.collection("messages").addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("ERROR FETCHING DOCUMENTS: \(String(describing: error))")
                return
            }
            self.messages = documents.compactMap { document -> Message? in
                do{
                    return try document.data(as: Message.self)
                } catch {
                    print("ERROR DECODING DOCUMENT INTO MESSAGE: \(String(describing: error))")
                    return nil
                }
            }
            
            self.messages.sort{$0.timestamp<$1.timestamp}
            if let id = self.messages.last?.id {
                self.lastMessageId = id
            }
            
        }
    }
    
    func sendMessage(text: String){
        do{
            let newMessage = Message(id:"\(UUID())", text: text, received: false, timestamp: Date())
            try db.collection("messages").document().setData(from: newMessage)
        } catch {
            print("ERROR ADDING MESSAGE TO FIRESTORE: \(error)")
        }
        
    }
}
