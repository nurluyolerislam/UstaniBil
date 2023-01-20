//
//  AuthViewModel.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 21.10.2022.
//

import Firebase

class AuthViewModel: ObservableObject{
    
    @Published var userSession: FirebaseAuth.User?
    @Published var didAuthenticateUser = false
    @Published var currentUser: User?
    private var tempUserSession: FirebaseAuth.User?
    
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
    
    func register(withEmail email: String, password: String, fullname: String, username: String){
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error{
                print("DEBUG: Failed to register with error\(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else {return}
            self.tempUserSession = user
            
            let data = [
                "email" : email,
                "username" : username.lowercased(),
                "fullname" : fullname,
                "uid" : user.uid
            ]
            
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data) { _ in
                    //                    profil resmi ekleme geldiğinde bura kullanılacak
                    //                    self.didAuthenticateUser = true
                    self.userSession = user
                }
        }
    }
    
    func signOut(){
        self.userSession = nil
        
        try? Auth.auth().signOut()
    }
    
    func fetchUser(){
        guard let uid = self.userSession?.uid else {return}
        
        self.service.fetchUser(withUid: uid) { user in
            self.currentUser = user
        }
    }
    
// TODO: Giriş yapmış bir kullanıcı olup olmadığını kontrol edecek olan fonksiyon yazılacak
//    func checkLoginStatus(){
//        Auth.auth().addStateDidChangeListener { auth, user in
//
//        }
//}
    
}
