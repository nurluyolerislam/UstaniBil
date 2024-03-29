//
//  AppoinmentsViewModel.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 8.01.2023.
//

import Foundation
import Firebase

class AppoinmentsViewModel: ObservableObject{
    @Published var confirmedAppoinments: [Appoinment] = []
    @Published var waitingAppoinments: [Appoinment] = []
    @Published var finishedAppoinments: [Appoinment] = []
    @Published var rejectedAppoinments: [Appoinment] = []
    
    let service = AppoinmentsService()
    
    func fetchAppoinments(){
        self.resetAppoinments()
        self.service.fetchAppoinmentsForUser { appoinments in
            for appoinment in appoinments {
                if appoinment.status == "confirmed"{
                    self.confirmedAppoinments.append(appoinment)
                }
                if appoinment.status == "waiting"{
                    self.waitingAppoinments.append(appoinment)
                }
                if appoinment.status == "finished"{
                    self.finishedAppoinments.append(appoinment)
                }
                if appoinment.status == "rejected"{
                    self.rejectedAppoinments.append(appoinment)
                }
            }
        }
    }
    
    func resetAppoinments(){
        self.confirmedAppoinments.removeAll()
        self.waitingAppoinments.removeAll()
        self.finishedAppoinments.removeAll()
        self.rejectedAppoinments.removeAll()
    }
}
