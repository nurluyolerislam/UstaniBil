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
        defaults.removeObject(forKey: "userFullname")
    }
    
    static var userEmail: String{
        get{
            return defaults.string(forKey: "userEmail") ?? ""
        }set{
            defaults.set(newValue, forKey: "userEmail")
        }
    }
    
    static func resetUserEmail(){
        defaults.removeObject(forKey: "userEmail")
    }
    
    static var userPhone: String{
        get{
            return defaults.string(forKey: "userPhone") ?? ""
        }set{
            defaults.set(newValue, forKey: "userPhone")
        }
    }
    
    static func resetUserPhone(){
        defaults.removeObject(forKey: "userPhone")
    }
    
    static var userAddress: String{
        get{
            return defaults.string(forKey: "userAddress") ?? ""
        }set{
            defaults.set(newValue, forKey: "userAddress")
        }
    }
    
    static func resetUserAddress(){
        defaults.removeObject( forKey: "userAddress")
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
    
    static func resetUserDefaults(){
        self.resetUserID()
        self.resetUserFullname()
        self.resetUserEmail()
        self.resetUserPhone()
        self.resetUserAddress()
        self.resetUserProfileImageLocation()
    }
}
