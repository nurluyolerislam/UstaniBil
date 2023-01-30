//
//  Review.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 30.01.2023.
//

import Foundation

struct Review: Decodable{
    let comment: String
    let id: String
    let mechanicID: String
    let score: Int
    let userFullname: String
    let userID: String
    let userProfileImageLocation: String
    
    enum CodingKeys: String, CodingKey {
        case comment
        case id
        case mechanicID = "mechanic_id"
        case score
        case userFullname = "user_fullname"
        case userID = "user_id"
        case userProfileImageLocation = "user_profile_image_location"
    }
}
