//
//  MechanicProfileViewModel.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 15.06.2023.
//

import Foundation

class MechanicProfileViewModel: ObservableObject{
    let mechanicService = MechanicsService()
    
    @Published var mechanicServices : [Service] = []
    
    init() {
        self.fetchMechanicServices()
    }
    
    func fetchMechanicServices(){
        self.mechanicService.fetchMechanic(withID: ApplicationVariables.userID) { mechanic in
            if let services = mechanic.services{
                self.mechanicServices = services
            }
        }
    }
}
