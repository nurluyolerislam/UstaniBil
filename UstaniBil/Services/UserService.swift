//
//  UserService.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 21.10.2022.
//

import Firebase

struct UserService{
    
    func fetchUser(withUid uid: String, completion: @escaping(User) -> Void){
        Firestore.firestore().collection("users")
            .document(uid)
            .getDocument { snapshot, error in
                
                guard let snapshot = snapshot else {return}
                
                guard let user = try? snapshot.data(as: User.self) else {return}
                
                completion(user)
            }
    }
}
