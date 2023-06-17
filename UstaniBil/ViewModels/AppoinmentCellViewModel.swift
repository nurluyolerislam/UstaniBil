//
//  AppoinmentCellViewModel.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 31.01.2023.
//

import Foundation
import Firebase

class AppoinmentCellViewModel: ObservableObject{
    @Published var mechanicName: String = ""
    
    func removeAppointment(appointmentID: String){
        Firestore.firestore().collection("appoinments")
            .document(appointmentID)
            .delete { error in
                if let error = error {
                    print("DEBUG: Failed to remove appointment with error\(error.localizedDescription)")
                } else {
                    print("Appointment removed succesfully")
                }
            }
    }
    
    func fetchMechanicNameFromMechanicReference(ref: DocumentReference){
        ref.getDocument { snapshot, error in
            if let error = error{
                print("DEBUG: Failed to fetch mechanic name from mechanic reference with error\(error.localizedDescription)")
            }
            
            guard let mechanic = snapshot?.data() else{return}
            
            guard let mechanicName = mechanic["fullname"] as? String else {return}
            
            self.mechanicName = mechanicName
        }
    }
}
