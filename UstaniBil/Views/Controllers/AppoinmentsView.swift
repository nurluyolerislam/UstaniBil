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
            if let confirmedAppoinments = self.viewModel.confirmedAppoinments{
                if !confirmedAppoinments.isEmpty{
                    Section {
                        ForEach(confirmedAppoinments) { appoinment in
                            AppoinmentCell(appoinment: appoinment)
                        }
                    } header: {
                        Text("Yaklaşan Randevularınız")
                    }
                }
            }
            
            if let waitingAppoinments = self.viewModel.waitingAppoinments{
                if !waitingAppoinments.isEmpty{
                    Section {
                        ForEach(waitingAppoinments) { appoinment in
                            AppoinmentCell(appoinment: appoinment)
                        }
                    } header: {
                        Text("Onay Bekleyen Randevularınız")
                    }
                }
            }
            
            if let finishedAppoinments = self.viewModel.finishedAppoinments{
                if !finishedAppoinments.isEmpty{
                    Section {
                        ForEach(finishedAppoinments) { appoinment in
                            AppoinmentCell(appoinment: appoinment)
                        }
                    } header: {
                        Text("Geçmiş Randevularınız")
                    }
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
