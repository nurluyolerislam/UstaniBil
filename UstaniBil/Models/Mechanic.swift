//
//  Mechanic.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 1.12.2022.
//

import Firebase
import FirebaseFirestoreSwift

struct Mechanic: Identifiable, Hashable, Codable{
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
    let profileImageLocation: String
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
        case profileImageLocation = "profile_image_location"
        case totalVotes = "total_votes"
    }
}
