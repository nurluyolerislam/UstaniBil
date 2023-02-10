//
//  Appoinment.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 8.01.2023.
//

import FirebaseFirestore

struct Appoinment: Decodable, Identifiable{
    
    let date: Timestamp
    let id: String
    let mechanicRef: DocumentReference
    let service: String
    let status: String
    let userRef: DocumentReference
    
    enum CodingKeys: String,CodingKey {
        case date
        case id
        case mechanicRef = "mechanic_ref"
        case service
        case status
        case userRef = "user_ref"
    }
    
}
