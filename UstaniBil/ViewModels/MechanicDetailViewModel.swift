//
//  MechanicDetailViewModel.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 30.01.2023.
//

import Foundation

class MechanicDetailViewModel: ObservableObject{
    let appoinmentService = AppoinmentsService()
    
    @Published var showingIndex = 0
    
    func requestAppoinment(date: Date, description: String, mechanicID: String){
        self.appoinmentService.requestAppoinment(date: date,
                                                 description: description,
                                                 mechanicID: mechanicID)
    }
}
