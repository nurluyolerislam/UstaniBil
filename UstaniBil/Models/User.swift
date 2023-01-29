//
//  User.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 21.10.2022.
//

struct User: Decodable{
    let address: String
    let cars: [Car]
    let email: String
    let fullname: String
    let id: String
    let phone: String
    let profileImageLocation: String
    let username: String
    
    enum CodingKeys:String, CodingKey {
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

struct Car: Decodable{
    let brand: String
    let model: String
    let year: String
    
    enum CodingKeys: CodingKey {
        case brand
        case model
        case year
    }
}
