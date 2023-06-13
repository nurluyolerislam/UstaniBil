//
//  MechanicAppointmentCellViewModel.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 7.06.2023.
//

import Foundation
import Firebase

class MechanicAppoinmentCellViewModel: ObservableObject{
    @Published var userFullname: String = ""
    
    func fetchUserFullnameFromUserReference(ref: DocumentReference){
        ref.getDocument { snapshot, error in
            if let error = error{
                print("DEBUG: Failed to fetch user fullname from user reference with error\(error.localizedDescription)")
            }
            
            guard let user = snapshot?.data() else{return}
            
            guard let userFullname = user["fullname"] as? String else {return}
            
            self.userFullname = userFullname
        }
    }
    
    func confirmAppointment(appointmentID: String){
        let ref = Firestore.firestore().collection("appoinments").document(appointmentID)
        ref.updateData(["status" : "confirmed"]) { error in
            if let error = error {
                print("DEBUG: Failed to confirm appointment status with error\(error.localizedDescription)")
            }
        }
    }
    
    func rejectAppointment(appointmentID: String){
        let ref = Firestore.firestore().collection("appoinments").document(appointmentID)
        ref.updateData(["status" : "rejected"]) { error in
            if let error = error {
                print("DEBUG: Failed to reject appointment status with error\(error.localizedDescription)")
            }
        }
    }
}
