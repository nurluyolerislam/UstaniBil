//
//  MechanicAppointmentsView.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 6.06.2023.
//

import SwiftUI

struct MechanicAppointmentsView: View {
    
    @StateObject var viewModel = MechanicAppointmentsViewModel()
    
    var body: some View {
        Form{
            if !self.viewModel.confirmedAppointments.isEmpty{
                Section {
                    ForEach(self.viewModel.confirmedAppointments) { appointment in
                        MechanicAppointmentCell(appointment: appointment,mechanicAppointmentsViewModel: self.viewModel)
                    }
                } header: {
                    Text("Yaklaşan Randevularınız")
                }
            }
            
            
            if !self.viewModel.waitingAppointments.isEmpty{
                Section {
                    ForEach(self.viewModel.waitingAppointments) { appointment in
                        MechanicAppointmentCell(appointment: appointment, mechanicAppointmentsViewModel: self.viewModel)
                    }
                } header: {
                    Text("Onay Bekleyen Randevularınız")
                }
            }
            
            
            if !self.viewModel.finishedAppointments.isEmpty{
                Section {
                    ForEach(self.viewModel.finishedAppointments) { appointment in
                        MechanicAppointmentCell(appointment: appointment, mechanicAppointmentsViewModel: self.viewModel)
                    }
                } header: {
                    Text("Geçmiş Randevularınız")
                }
            }
            
            if !self.viewModel.rejectedAppointments.isEmpty{
                Section {
                    ForEach(self.viewModel.rejectedAppointments) { appointment in
                        MechanicAppointmentCell(appointment: appointment, mechanicAppointmentsViewModel: self.viewModel)
                    }
                } header: {
                    Text("Reddettiğiniz Randevularınız")
                }
            }
            
            if self.viewModel.confirmedAppointments.isEmpty && self.viewModel.waitingAppointments.isEmpty && self.viewModel.finishedAppointments.isEmpty{
                Text("Henüz bir randevunuz bulunmamaktadır.")
            }
        }
        .onAppear {
            self.viewModel.fetchAppointments()
        }
    }
}

struct MechanicAppointmentsView_Previews: PreviewProvider {
    static var previews: some View {
        MechanicAppointmentsView()
    }
}
