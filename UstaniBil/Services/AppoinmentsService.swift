//
//  AppoinmentsService.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 29.01.2023.
//

import Firebase

struct AppoinmentsService{
    
    func fetchAppoinmentsForUser(completion: @escaping([Appoinment]) -> Void){
        let userRef = Firestore.firestore().collection("users").document(ApplicationVariables.userID)
        Firestore.firestore().collection("appoinments")
            .whereField("user_ref", isEqualTo: userRef)
            .getDocuments { snapshot, error in
                
                if let error = error{
                    print("DEBUG: Failed to fetch appoinments with error \(error.localizedDescription)")
                }
                
                guard let documents = snapshot?.documents else {return}
                
                let appoinments = documents.compactMap({try? $0.data(as: Appoinment.self)})
                
                completion(appoinments)
            }
    }
    
    func fetchAppointmentsForMechanic(completion: @escaping([Appoinment]) -> Void){
        let mechanicRef = Firestore.firestore().collection("mechanics").document(ApplicationVariables.userID)
        Firestore.firestore().collection("appoinments")
            .whereField("mechanic_ref", isEqualTo: mechanicRef)
            .getDocuments { snapshot, error in
                
                if let error = error{
                    print("DEBUG: Failed to fetch appoinments with error \(error.localizedDescription)")
                }
                
                guard let documents = snapshot?.documents else {return}
                
                let appoinments = documents.compactMap({try? $0.data(as: Appoinment.self)})
                
                completion(appoinments)
            }
    }
    
    func requestAppoinment(carModel: String, date: Date, service: String, mechanicID: String){
        let mechanicRef = Firestore.firestore().collection("mechanics").document(mechanicID)
        let userRef = Firestore.firestore().collection("users").document(ApplicationVariables.userID)
        let data = [
            "car_model" : "belirtilmedi",
            "date" : Timestamp(date: date),
            "mechanic_ref" : mechanicRef,
            "service" : service,
            "status" : "waiting",
            "user_ref" : userRef
        ] as [String : Any]
        
        var ref: DocumentReference? = nil
        
        ref = Firestore.firestore().collection("appoinments")
            .addDocument(data: data) { error in
                if let error = error{
                    print("DEBUG: Failed to request appoinment with error \(error.localizedDescription)")
                } else{
                    ref?.setData(["id" : ref?.documentID], merge: true)
                }
            }
    }
    
}
