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
    
    func addCar(car: Car){
        
        let newCar: [String:Any] = [
            "id" : car.id,
            "model" : car.model,
            "logo" : car.logo,
            "brand_id" : car.brandID
        ]
        
        Firestore.firestore().collection("users").document(ApplicationVariables.userID)
            .updateData([
                "cars" : FieldValue.arrayUnion([newCar])
            ]) { error in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    print("Yeni araç başarıyla eklendi.")
                }
            }
    }
    
    func removeCar(id: String){
        Firestore.firestore().collection("users").document(ApplicationVariables.userID)
            .updateData(["cars" : FieldValue.arrayRemove([id])]){ error in
                if let error = error {
                    print("Error removing car: \(error.localizedDescription)")
                } else {
                    print("Car successfully removed")
                }
            }
    }
    
    func updateUser(email: String, fullname: String, address: String, phone: String){
        Firestore.firestore().collection("users").document(ApplicationVariables.userID)
            .updateData([
                "email" : email,
                "fullname" : fullname,
                "address" : address,
                "phone" : phone
            ]) { error in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    print("Kullanıcı bilgileri güncellendi.")
                }
            }
    }
    
}
