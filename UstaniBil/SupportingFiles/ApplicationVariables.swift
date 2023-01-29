//
//  ApplicationVariables.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 25.01.2023.
//

import Foundation

struct ApplicationVariables{
    static let defaults = UserDefaults.standard
    
    static var isUserLoggedIn: Bool{
        get{
            return defaults.bool(forKey: "isLoggedIn")
        }set{
            defaults.set(newValue, forKey: "isLoggedIn")
        }
    }
    
    static var userID: String{
        get{
            return defaults.string(forKey: "userID") ?? ""
        }set{
            defaults.set(newValue, forKey: "userID")
        }
    }
    
}
