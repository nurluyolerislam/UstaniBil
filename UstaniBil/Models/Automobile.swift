//
//  Automobile.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 12.06.2023.
//

import Foundation

struct Automobile: Codable{
    let brandID: Int
    let description: String
    let id: Int
    let name: String
    let photos: String
    
    enum CodingKeys: String, CodingKey{
        case brandID = "brand_id"
        case description
        case id
        case name
        case photos
    }
}
