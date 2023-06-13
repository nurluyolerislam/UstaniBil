//
//  AuthViewModel.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 21.10.2022.
//

import Firebase
import FirebaseAuth

class AuthViewModel: ObservableObject{
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    @Published var accountType: AccountType? = nil
    
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
    
    func register(email: String, password: String, address: String, car: Car, fullname: String, phone: String, username: String){
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error{
                print("DEBUG: Failed to register with error\(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else {return}
            
            let data = [
                "account_type" : "user",
                "address" : address,
                "cars" : [
                    [
                        "model" : car.model
                    ]
                ],
                "email" : email,
                "fullname" : fullname,
                "id" : user.uid,
                "phone" : phone,
                "profile_image_location" : "",
                "username" : username.lowercased()
            ]
            
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data) { error in
                    if let error = error{
                        print("DEBUG: Failed to set user's data to firestore with error \(error.localizedDescription)")
                    }
                    self.userSession = user
                }
        }
    }
    
    func registerMechanic(email: String,
                          password: String,
                          fullname: String,
                          address: String,
                          about: String,
                          brand: String,
                          company: String,
                          education: String,
                          languages: String,
                          phone: String){
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error{
                print("DEBUG: Failed to register mechanic with error\(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else {return}
            
            let data = [
                "about" : about,
                "account_type" : "mechanic",
                "address" : address,
                "brand" : brand,
                "company" : company,
                "education" : education,
                "email" : email,
                "fullname" : fullname,
                "id" : user.uid,
                "languages" : languages,
                "phone" : phone,
                "profile_image_location" : ""
            ]
            
            Firestore.firestore().collection("mechanics")
                .document(user.uid)
                .setData(data) { error in
                    if let error = error{
                        print("DEBUG: Failed to set mechanic's data to firestore with error \(error.localizedDescription)")
                    }
                    self.accountType = .mechanic
                }
        }
    }
    
    func signOut(){
        try? Auth.auth().signOut()
        self.userSession = nil
        self.accountType = nil
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
            ApplicationVariables.userID = mechanic.id
            ApplicationVariables.userFullname = mechanic.fullname
            ApplicationVariables.userProfileImageLocation = mechanic.profileImageLocation
            ApplicationVariables.userAddress = mechanic.address
            ApplicationVariables.userEmail = mechanic.email
            ApplicationVariables.userPhone = mechanic.phone
        }
    }
    
    // TODO: Giriş yapmış bir kullanıcı olup olmadığını kontrol edecek olan fonksiyon yazılacak
    //    func checkLoginStatus(){
    //        Auth.auth().addStateDidChangeListener { auth, user in
    //
    //        }
    //}
    
}

enum AccountType: String {
    case mechanic = "mechanic"
    case user = "user"
}
