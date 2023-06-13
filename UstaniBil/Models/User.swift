//
//  User.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 21.10.2022.
//

import Foundation

struct User: Decodable{
    let accountType: String
    let address: String
    let cars: [Car]
    let email: String
    let fullname: String
    let id: String
    let phone: String
    let profileImageLocation: String
    let username: String
    
    enum CodingKeys:String, CodingKey {
        case accountType = "account_type"
        case address
        case cars
        case email
        case fullname
        case id
        case phone
        case profileImageLocation = "profile_image_location"
        case username
    }
}

struct Car: Decodable, Identifiable{
    let brandID: Int
    let id: String = UUID().uuidString
    let logo: String
    let model: String
    
    enum CodingKeys: String, CodingKey {
        case brandID = "brand_id"
        case id
        case logo
        case model
    }
}
