//
//  MechanicsService.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 1.12.2022.
//

import Firebase

class MechanicsService{
    
    var mechanics : [Mechanic] = []
    
    func fetchMechanics(city: String, brand: String){
        Firestore.firestore().collection("mechanics")
            .whereField("city", isEqualTo: city)
            .whereField("brand", isEqualTo: brand)
            .getDocuments { snapshot, error in
                guard let snapshot = snapshot else {return}
                
                for document in snapshot.documents{
                    self.mechanics.append(document as! Mechanic)
                }
                
            }
    }
}
