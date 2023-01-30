//
//  Mechanic.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 1.12.2022.
//

import Firebase
import FirebaseFirestoreSwift

struct Mechanic: Identifiable, Decodable{
    let about: String
    let address:String
    let avarageScore:Double
    let brand:String
    let company:String
    let education:String
    let email:String
    let fullname:String
    let id: String
    let languages: [String]
    let phone: String
    let priceList: [Service]
    let profileImageLocation: String
//    let reviews: [Review]
    let totalVotes:Int
    
    enum CodingKeys: String, CodingKey {
        case about
        case address
        case avarageScore = "avarage_score"
        case brand
        case company
        case education
        case email
        case fullname
        case id
        case languages
        case phone
        case priceList = "price_list"
        case profileImageLocation = "profile_image_location"
//        case reviews
        case totalVotes = "total_votes"
    }
}

struct Service: Hashable, Decodable{
    let service: String
    let price: Int
    
    enum CodingKeys: String, CodingKey {
        case service
        case price
    }
}

//struct Review: Hashable, Decodable{
//    let comment: String
//    let userID: String
//    let vote: Int
//
//    enum CodingKeys: String, CodingKey {
//        case comment
//        case userID = "user_id"
//        case vote
//    }
//}
