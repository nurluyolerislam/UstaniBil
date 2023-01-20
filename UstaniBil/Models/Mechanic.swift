//
//  Mechanic.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 1.12.2022.
//

import Firebase
import FirebaseFirestoreSwift

struct Mechanic: Hashable,Identifiable{
    let id = UUID().uuidString
    let avarageScore: Double
    let brand: String
    let city: String
    let company: String
    let fullName: String
    let phone: String
    let totalVote: Int
}
