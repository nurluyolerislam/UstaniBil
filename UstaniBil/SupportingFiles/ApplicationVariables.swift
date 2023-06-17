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
    
    static var mechanicAbout: String{
        get{
            return defaults.string(forKey: "mechanicAbout") ?? ""
        }set{
            defaults.set(newValue, forKey: "mechanicAbout")
        }
    }
    
    static func resetMechanicAbout(){
        defaults.removeObject( forKey: "mechanicAbout")
    }
    
    static var mechanicCompany: String{
        get{
            return defaults.string(forKey: "mechanicCompany") ?? ""
        }set{
            defaults.set(newValue, forKey: "mechanicCompany")
        }
    }
    
    static func resetMechanicCompany(){
        defaults.removeObject( forKey: "mechanicCompany")
    }
    
    static var mechanicEducation: String{
        get{
            return defaults.string(forKey: "mechanicEducation") ?? ""
        }set{
            defaults.set(newValue, forKey: "mechanicEducation")
        }
    }
    
    static func resetMechanicEducation(){
        defaults.removeObject( forKey: "mechanicEducation")
    }
    
    static func resetUserDefaults(){
        self.resetUserID()
        self.resetUserFullname()
        self.resetUserEmail()
        self.resetUserPhone()
        self.resetUserAddress()
        self.resetUserProfileImageLocation()
        self.resetMechanicAbout()
        self.resetMechanicCompany()
        self.resetMechanicEducation()
    }
}
