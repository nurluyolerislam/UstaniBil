//
//  Mechanic.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 1.12.2022.
//

import Firebase
import FirebaseFirestoreSwift

struct Mechanic: Identifiable, Decodable{
    let accountType: String
    let about: String
    let address:String
    let brand:String
    let brandID: Int
    let company:String
    let education:String
    let email:String
    let fullname:String
    let id: String
    let languages: [String]
    let phone: String
    let profileImageLocation: String
    let services: [Service]
    
    enum CodingKeys: String, CodingKey {
        case accountType = "account_type"
        case about
        case address
        case brand
        case brandID = "brand_id"
        case company
        case education
        case email
        case fullname
        case id
        case languages
        case phone
        case profileImageLocation = "profile_image_location"
        case services
    }
}


struct Service: Hashable, Decodable{
    let price: Int
    let service: String
    
    enum CodingKeys: String, CodingKey {
        case price
        case service
    }
}
