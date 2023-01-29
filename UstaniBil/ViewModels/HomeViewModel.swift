//
//  HomeViewModel.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 28.01.2023.
//

import Foundation
import Firebase

class HomeViewModel: ObservableObject{
    let service = MechanicsService()
    
    @Published var searchText: String = ""
    @Published var mechanics: [Mechanic] = []
    
    func fetchMechanics(){
        self.service.fetchMechanics { mechanics in
            self.mechanics = mechanics
        }
    }
}
