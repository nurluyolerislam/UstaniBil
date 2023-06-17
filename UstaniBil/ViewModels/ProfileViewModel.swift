//
//  ProfileViewModel.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 13.06.2023.
//

import Foundation
import Firebase

class ProfileViewModel: ObservableObject{
    @Published var userCars: [Car] = []
    let userService = UserService()
    
    init() {
        self.fetchUserCars()
    }
    
    func fetchUserCars(){
        self.userService.fetchUser(withID: ApplicationVariables.userID) { user in
            if let cars = user.cars {
                self.userCars = cars
            }
        }
    }
}
