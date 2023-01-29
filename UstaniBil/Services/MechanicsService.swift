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
    
}
