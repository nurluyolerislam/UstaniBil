//
//  AppoinmentsView.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 26.12.2022.
//

import SwiftUI

struct AppoinmentsView: View {
    
    @StateObject var viewModel = AppoinmentsViewModel()
    
    var body: some View {
        Form{
            if !self.viewModel.confirmedAppoinments.isEmpty{
                Section {
                    ForEach(self.viewModel.confirmedAppoinments) { appoinment in
                        AppoinmentCell(appoinment: appoinment, appoinmentsViewModel: self.viewModel)
                    }
                } header: {
                    Text("Yaklaşan Randevularınız")
                }
            }
            
            
            if !self.viewModel.waitingAppoinments.isEmpty{
                Section {
                    ForEach(self.viewModel.waitingAppoinments) { appoinment in
                        AppoinmentCell(appoinment: appoinment, appoinmentsViewModel: self.viewModel)
                    }
                } header: {
                    Text("Onay Bekleyen Randevularınız")
                }
            }
            
            
            if !self.viewModel.finishedAppoinments.isEmpty{
                Section {
                    ForEach(self.viewModel.finishedAppoinments) { appoinment in
                        AppoinmentCell(appoinment: appoinment, appoinmentsViewModel: self.viewModel)
                    }
                } header: {
                    Text("Geçmiş Randevularınız")
                }
            }
            
            if !self.viewModel.rejectedAppoinments.isEmpty{
                Section {
                    ForEach(self.viewModel.rejectedAppoinments) { appoinment in
                        AppoinmentCell(appoinment: appoinment, appoinmentsViewModel: self.viewModel)
                    }
                } header: {
                    Text("Reddedilen Randevularınız")
                }
            }
            
            if self.viewModel.confirmedAppoinments.isEmpty && self.viewModel.waitingAppoinments.isEmpty && self.viewModel.finishedAppoinments.isEmpty{
                Text("Henüz bir randevunuz bulunmamaktadır.")
            }
        }
        .onAppear {
            self.viewModel.fetchAppoinments()
        }
    }
}

struct AppoinmentsView_Previews: PreviewProvider {
    static var previews: some View {
        AppoinmentsView()
    }
}
