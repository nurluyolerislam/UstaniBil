//
//  ReviewService.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 30.01.2023.
//

import Foundation
import Firebase

struct ReviewService{
    
    func createReviewForMechanic(comment: String, mechanicID: String, score: Int){
        
        let data = [
            "comment" : comment,
            "mechanic_id" : mechanicID,
            "score" : score,
            "user_fullname" : ApplicationVariables.userFullname,
            "user_id" : ApplicationVariables.userID,
            "user_profile_image_location" : ApplicationVariables.userProfileImageLocation
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
    
}
