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
    
    func fetchReviewsForMechanic(id: String, completion: @escaping([Review]) -> Void){
        Firestore.firestore().collection("reviews")
            .whereField("mechanic_id", isEqualTo: id)
            .getDocuments { snapshot, error in
                if let error = error{
                    print("DEBUG: Failed to fetch reviews for mechanic wih error \(error.localizedDescription)")
                }
                
                guard let documents = snapshot?.documents else{return}
                let reviews = documents.compactMap({try? $0.data(as: Review.self)})
                completion(reviews)
            }
    }
    
}
