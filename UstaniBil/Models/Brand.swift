//
//  Brand.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 12.06.2023.
//

import Foundation

struct Brand: Codable{
    let id: Int
    let logoURL: String
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case logoURL = "logo"
        case name
    }
}
