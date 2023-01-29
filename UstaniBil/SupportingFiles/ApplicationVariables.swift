//
//  ApplicationVariables.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 25.01.2023.
//

import Foundation

struct ApplicationVariables{
    static let defaults = UserDefaults.standard
    
    static var userID: String{
        get{
            return defaults.string(forKey: "userID") ?? ""
        }set{
            defaults.set(newValue, forKey: "userID")
        }
    }
    
    static func resetUserID(){
        defaults.removeObject(forKey: "userID")
    }
}
