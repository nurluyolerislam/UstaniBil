//
//  Review.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 30.01.2023.
//

import Firebase

struct Review: Decodable{
    let comment: String
    let id: String
    let mechanicRef: DocumentReference
    let score: Int
    let userRef: DocumentReference
    
    enum CodingKeys: String, CodingKey {
        case comment
        case id
        case mechanicRef = "mechanic_ref"
        case score
        case userRef = "user_ref"
    }
    
}
