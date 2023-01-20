//
//  User.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 21.10.2022.
//

import Firebase
import FirebaseFirestoreSwift

struct User:Identifiable, Decodable{
    @DocumentID var id: String?
    let email: String
    let username: String
    let fullname: String
    
    var isCurrentUser: Bool{
        return Auth.auth().currentUser?.uid == id
    }
}
