//
//  MechanicAppointmentsViewModel.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 7.06.2023.
//

import Foundation

class MechanicAppointmentsViewModel: ObservableObject{
    @Published var confirmedAppointments: [Appoinment] = []
    @Published var waitingAppointments: [Appoinment] = []
    @Published var finishedAppointments: [Appoinment] = []
    @Published var rejectedAppointments: [Appoinment] = []
    
    let service = AppoinmentsService()
    
    func fetchAppointments(){
        self.resetAppointments()
        self.service.fetchAppointmentsForMechanic { appointments in
            for appointment in appointments {
                if appointment.status == "confirmed"{
                    self.confirmedAppointments.append(appointment)
                }
                if appointment.status == "waiting"{
                    self.waitingAppointments.append(appointment)
                }
                if appointment.status == "finished"{
                    self.finishedAppointments.append(appointment)
                }
                if appointment.status == "rejected"{
                    self.rejectedAppointments.append(appointment)
                }
            }
        }
    }
    
    func resetAppointments(){
        self.confirmedAppointments.removeAll()
        self.waitingAppointments.removeAll()
        self.finishedAppointments.removeAll()
        self.rejectedAppointments.removeAll()
    }
}
