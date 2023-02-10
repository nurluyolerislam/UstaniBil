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
    
    init(){
        self.userSession = Auth.auth().currentUser
        self.fetchUser()
    }
    
    private let service = UserService()
    
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
    
    func register(email: String, password: String, address: String, car: Car, fullname: String, phone: String, username: String){
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error{
                print("DEBUG: Failed to register with error\(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else {return}
            
            let data = [
                "address" : address,
                "cars" : [
                    [
                        "brand" : car.brand,
                        "model" : car.model,
                        "year" : car.year
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
    
    func signOut(){
        try? Auth.auth().signOut()
        self.userSession = nil
        ApplicationVariables.reserUserDefaults()
    }
    
    func fetchUser(){
        guard let id = self.userSession?.uid else {return}
        
        self.service.fetchUser(withID: id) { user in
            self.currentUser = user
            ApplicationVariables.userID = user.id
            ApplicationVariables.userFullname = user.fullname
            ApplicationVariables.userProfileImageLocation = user.profileImageLocation
        }
    }
    
// TODO: Giriş yapmış bir kullanıcı olup olmadığını kontrol edecek olan fonksiyon yazılacak
//    func checkLoginStatus(){
//        Auth.auth().addStateDidChangeListener { auth, user in
//
//        }
//}
    
}
