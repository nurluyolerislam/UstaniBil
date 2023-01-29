//
//  AppoinmentsViewModel.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 8.01.2023.
//

import Foundation
import Firebase

class AppoinmentsViewModel: ObservableObject{
    @Published var appoinments: [Appoinment] = []
    
    let service = AppoinmentsService()
    
    func fetchAppoinments(){
        self.service.fetchAppoinments { appoinments in
            self.appoinments = appoinments
        }
    }
}
