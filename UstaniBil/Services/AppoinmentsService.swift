//
//  AppoinmentsService.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 29.01.2023.
//

import Firebase

struct AppoinmentsService{
    
    func fetchAppoinments(completion: @escaping([Appoinment]) -> Void){
        Firestore.firestore().collection("appoinments")
            .whereField("user_id", isEqualTo: ApplicationVariables.userID)
            .getDocuments { snapshot, error in
                
                if let error = error{
                    print("DEBUG: Failed to fetch appoinments with error \(error.localizedDescription)")
                }
                
                guard let documents = snapshot?.documents else {return}
                
                let appoinments = documents.compactMap({try? $0.data(as: Appoinment.self)})
                
                completion(appoinments)
            }
    }
    
}
