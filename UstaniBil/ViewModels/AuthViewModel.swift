//
//  AuthViewModel.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 21.10.2022.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseStorage

class AuthViewModel: ObservableObject{
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    @Published var accountType: AccountType? = nil
    @Published var tempAccountType: AccountType? = nil
    private var tempUserSession: FirebaseAuth.User?
    @Published var didAuthenticateUser = false
    
    init(){
        self.userSession = Auth.auth().currentUser
        self.fetchUser()
        self.fetchMechanic()
    }
    
    private let userService = UserService()
    private let mechanicService = MechanicsService()
    
    func login(withEmail email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error{
                print("DEBUG: Failed to login with error \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else {return}
            self.userSession = user
            self.fetchUser()
        }
    }
    
    func loginAsMechanic(withEmail email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error{
                print("DEBUG: Failed to login as mechanic with error \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else {return}
            self.userSession = user
            self.fetchMechanic()
        }
    }
    
    func register(email: String, password: String, address: String, fullname: String, phone: String){
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error{
                print("DEBUG: Failed to register with error\(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else {return}
            self.tempUserSession = user
            
            let data = [
                "account_type" : "user",
                "address" : address,
                "email" : email,
                "fullname" : fullname,
                "id" : user.uid,
                "phone" : phone
            ]
            
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data) { error in
                    if let error = error{
                        print("DEBUG: Failed to set user's data to firestore with error \(error.localizedDescription)")
                    }
                    self.didAuthenticateUser = true
                    self.tempAccountType = .user
                }
        }
    }
    
    func registerMechanic(email: String,
                          password: String,
                          fullname: String,
                          address: String,
                          about: String,
                          brand: String,
                          brandID: Int,
                          company: String,
                          education: String,
                          phone: String){
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error{
                print("DEBUG: Failed to register mechanic with error\(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else {return}
            self.tempUserSession = user
            
            let data = [
                "about" : about,
                "account_type" : "mechanic",
                "address" : address,
                "brand" : brand,
                "brand_id" : brandID,
                "company" : company,
                "education" : education,
                "email" : email,
                "fullname" : fullname,
                "id" : user.uid,
                "phone" : phone
            ]
            
            Firestore.firestore().collection("mechanics")
                .document(user.uid)
                .setData(data) { error in
                    if let error = error{
                        print("DEBUG: Failed to set mechanic's data to firestore with error \(error.localizedDescription)")
                    }
                    self.didAuthenticateUser = true
                    self.tempAccountType = .mechanic
                }
        }
    }
    
    func signOut(){
        try? Auth.auth().signOut()
        self.userSession = nil
        self.accountType = nil
        self.didAuthenticateUser = false
        ApplicationVariables.resetUserDefaults()
    }
    
    func fetchUser(){
        guard let id = self.userSession?.uid else {return}
        
        self.userService.fetchUser(withID: id) { user in
            self.currentUser = user
            self.accountType = .user
            ApplicationVariables.userID = user.id
            ApplicationVariables.userFullname = user.fullname
            ApplicationVariables.userProfileImageLocation = user.profileImageLocation
            ApplicationVariables.userAddress = user.address
            ApplicationVariables.userEmail = user.email
            ApplicationVariables.userPhone = user.phone
        }
    }
    
    func fetchMechanic(){
        guard let id = self.userSession?.uid else {return}
        
        self.mechanicService.fetchMechanic(withID: id) { mechanic in
            self.accountType = .mechanic
            ApplicationVariables.mechanicAbout = mechanic.about
            ApplicationVariables.mechanicCompany = mechanic.company
            ApplicationVariables.mechanicEducation = mechanic.education
            ApplicationVariables.userID = mechanic.id
            ApplicationVariables.userFullname = mechanic.fullname
            ApplicationVariables.userProfileImageLocation = mechanic.profileImageLocation
            ApplicationVariables.userAddress = mechanic.address
            ApplicationVariables.userEmail = mechanic.email
            ApplicationVariables.userPhone = mechanic.phone
        }
    }
    
    func uploadProfileImage(_ image: UIImage) {
        guard let uid = self.tempUserSession?.uid else {return}
        
        ImageUploader.uploadImage(image: image) { profileImageUrl in
            if self.tempAccountType == .user {
                Firestore.firestore().collection("users")
                    .document(uid)
                    .updateData(["profile_image_location" : profileImageUrl]) { _ in
                        self.userSession = self.tempUserSession
                        self.fetchUser()
                    }
            } else if self.tempAccountType == .mechanic {
                Firestore.firestore().collection("mechanics")
                    .document(uid)
                    .updateData(["profile_image_location" : profileImageUrl]) { _ in
                        self.fetchMechanic()
                    }
            } else {
                return
            }
        }
    }
    
}

enum AccountType: String {
    case mechanic = "mechanic"
    case user = "user"
}
