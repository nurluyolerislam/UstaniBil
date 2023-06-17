//
//  MechanicsService.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 1.12.2022.
//

import Firebase

class MechanicsService{
    
    func fetchMechanics(completion: @escaping([Mechanic]) -> Void){
        Firestore.firestore().collection("mechanics")
            .getDocuments { snapshot, error in
                if let error = error{
                    print("DEBUG: Failed to fetch mechanics with error \(error.localizedDescription)")
                }
                guard let documents = snapshot?.documents else {return}
                let mechanics = documents.compactMap({try? $0.data(as: Mechanic.self)})
                completion(mechanics)
            }
    }
    
    func fetchMechanic(withID id: String, completion: @escaping(Mechanic) -> Void){
        Firestore.firestore().collection("mechanics")
            .document(id)
            .getDocument { snapshot, error in
                
                if let error = error{
                    print("DEBUG: Failed to fetch mechanic with error \(error.localizedDescription)")
                }
                
                guard let snapshot = snapshot else {return}
                
                do{
                    let mechanic = try snapshot.data(as: Mechanic.self)
                    completion(mechanic)
                } catch{
                    print(error)
                }
            }
    }
    
    func updateMechanic(about: String, company: String, education: String, email: String, fullname: String, address: String, phone: String){
        Firestore.firestore().collection("mechanics").document(ApplicationVariables.userID)
            .updateData([
                "about" : about,
                "company" : company,
                "education" : education,
                "email" : email,
                "fullname" : fullname,
                "address" : address,
                "phone" : phone
            ]) {
                error in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    print("Usta bilgileri güncellendi.")
                }
            }
    }
    
    func addService(service: Service){
        let newService : [String : Any] = [
            "service" : service.service,
            "price" : service.price
        ]
        Firestore.firestore().collection("mechanics").document(ApplicationVariables.userID)
            .updateData([
                "services" : FieldValue.arrayUnion([newService])
            ]) { error in
                if let error = error{
                    print(error.localizedDescription)
                } else {
                    print("Hizmet başarıyla eklendi")
                }
            }
    }
    
}
