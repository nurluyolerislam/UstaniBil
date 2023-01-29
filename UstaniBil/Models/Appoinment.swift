//
//  Appoinment.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 8.01.2023.
//

import FirebaseFirestore

struct Appoinment: Codable{
    let date: Timestamp
    let description: String
    let id: String
    let mechanicID: String
    let status: String
    let userID: String
    
    enum CodingKeys: String,CodingKey {
        case date
        case description
        case id
        case mechanicID = "mechanic_id"
        case status
        case userID = "user_id"
    }
}
