//
//  MechanicInAppModel.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 25.05.2023.
//

import Foundation

struct MechanicInAppModel: Identifiable{
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
    let services: [Service]
    let totalVotes:Int
}
