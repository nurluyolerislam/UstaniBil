//
//  ReviewService.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 30.01.2023.
//

import Firebase

struct ReviewService{
    
    func createReviewForMechanic(comment: String, mechanicID: String, score: Int){
        
        let data = [
            "comment" : comment,
            "mechanic_ref" : Firestore.firestore().collection("mechanics").document(mechanicID),
            "score" : score,
            "user_ref" : Firestore.firestore().collection("users").document(ApplicationVariables.userID)
        ] as [String : Any]
        
        var ref: DocumentReference? = nil
        
        ref = Firestore.firestore().collection("reviews")
            .addDocument(data: data) { error in
                if let error = error{
                    print("DEBUG: Failed to create review with error \(error.localizedDescription)")
                } else{
                    ref?.setData(["id" : ref?.documentID], merge: true)
                }
            }
    }
    
    func fetchReviewsForMechanic(mechanicID: String, completion: @escaping([Review]) -> Void){
        let mechanicRef = Firestore.firestore().collection("mechanics").document(mechanicID)
        Firestore.firestore().collection("reviews")
            .whereField("mechanic_ref", isEqualTo: mechanicRef)
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
