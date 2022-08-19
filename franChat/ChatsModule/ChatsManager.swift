//
//  ChatsManager.swift
//  franChat
//
//  Created by Agustin Franchetti on 18/08/2022.
//

import Foundation

import FirebaseFirestore
import FirebaseFirestoreSwift

class ChatsManager: ObservableObject {
    @Published private(set) var chats: [Chat] = []
    let db = Firestore.firestore()
    
    init(){
        getChats()
    }
    
    func getChats(){
        db.collection("chats").addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents  else {
                print("ERROR FETCHING CHATS: \(String(describing: error))")
                return
            }
            self.chats = documents.compactMap { document -> Chat? in
                do{
                    print("CHATS", document)
                    return try document.data(as: Chat.self)
                    
                } catch {
                    print("ERROR DECODING DOCUMENT INTO CHAT: \(String(describing: error))")
                    return nil
                }
            }
        }
    }
    
    func startChat(user1: String, user2: String){
        do{
            let newChat = Chat(id:"\(UUID())", user1: user1, user2: user2)
            try db.collection("chats").document().setData(from: newChat)
        } catch {
            print("ERROR STARTING NEW CHAT TO FIRESTORE: \(error)")
        }
        
    }
}
