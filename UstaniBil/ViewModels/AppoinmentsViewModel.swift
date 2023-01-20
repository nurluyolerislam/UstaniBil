//
//  AppoinmentsViewModel.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 8.01.2023.
//

import Foundation
import Firebase

class AppoinmentsViewModel: ObservableObject{
    @Published var appoinments = [Appoinment]()
    
    func fetchAppoinments(){
        let db = Firestore.firestore()
        let ref = db.collection("appoinments")
        ref.whereField("user_id", isEqualTo: "SlDZzLQxYBNKS32IpyiyRMxbnrp1").getDocuments { snapshot, error in
            
            if let error = error{
                print(error.localizedDescription)
            }
            
            guard let snapshot = snapshot else {return}
            
            for document in snapshot.documents{
                print("\(document.documentID) => \(document.data())")
            }
            
        }
    }
}
