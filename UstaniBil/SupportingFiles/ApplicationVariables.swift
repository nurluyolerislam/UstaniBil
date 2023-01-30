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
        defaults.removeObject( forKey: "userID")
    }
    
    static var userFullname: String{
        get{
            return defaults.string(forKey: "userFullname") ?? ""
        }set{
            defaults.set(newValue, forKey: "userFullname")
        }
    }
    
    static func resetUserFullname(){
        defaults.removeObject( forKey: "userFullname")
    }
    
    static var userProfileImageLocation: String{
        get{
            return defaults.string(forKey: "userProfileImageLocation") ?? ""
        }set{
            defaults.set(newValue, forKey: "userProfileImageLocation")
        }
    }
    
    static func resetUserProfileImageLocation(){
        defaults.removeObject( forKey: "userProfileImageLocation")
    }
    
    static func reserUserDefaults(){
        self.resetUserID()
        self.resetUserFullname()
        self.resetUserProfileImageLocation()
    }
}
