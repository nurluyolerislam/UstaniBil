//
//  UserService.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 21.10.2022.
//

import Firebase

struct UserService{
    
    func fetchUser(withID id: String, completion: @escaping(User) -> Void){
        Firestore.firestore().collection("users")
            .document(id)
            .getDocument { snapshot, error in
                
                if let error = error{
                    print("DEBUG: Failed to fetch user with error \(error.localizedDescription)")
                }
                
                guard let snapshot = snapshot else {return}
                
                do{
                    let user = try snapshot.data(as: User.self)
                    completion(user)
                } catch{
                    print(error)
                }
            }
    }
    
    func fetchUser(withRef ref: DocumentReference, completion: @escaping(User) -> Void){
        ref
            .getDocument { snapshot, error in
                
                if let error = error{
                    print("DEBUG: Failed to fetch user with error \(error.localizedDescription)")
                }
                
                guard let snapshot = snapshot else {return}
                
                do{
                    let user = try snapshot.data(as: User.self)
                    completion(user)
                } catch{
                    print(error)
                }
            }
    }
    
}
