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
    let reviewService = ReviewService()
    let userService = UserService()
    
    @Published var searchText: String = ""
    @Published var mechanics: [MechanicInAppModel] = []
    @Published var userCars: [Car] = []
    @Published var selectedBrandID: Int = 0
    
    func fetchUserCars(){
        self.userCars.removeAll()
        self.userService.fetchUser(withID: ApplicationVariables.userID) { user in
            if let cars = user.cars {
                self.userCars = cars
            }
        }
    }
    
    func fetchMechanics(){
        self.mechanics.removeAll()
        self.service.fetchMechanics{ mechanics in
            mechanics.filter{$0.brandID == self.selectedBrandID}.forEach { mechanic in
                self.reviewService.fetchReviewsForMechanic(mechanicID: mechanic.id) { reviews in
                    var avarageScore: Double = 0
                    reviews.forEach { review in
                        avarageScore += Double(review.score) / Double(reviews.count)
                    }
                    self.mechanics.append(MechanicInAppModel(accountType: mechanic.accountType,
                                                             about: mechanic.about,
                                                             address: mechanic.address,
                                                             avarageScore: avarageScore,
                                                             brand: mechanic.brand,
                                                             company: mechanic.company,
                                                             education: mechanic.education,
                                                             email: mechanic.email,
                                                             fullname: mechanic.fullname,
                                                             id: mechanic.id,
                                                             phone: mechanic.phone,
                                                             profileImageLocation: mechanic.profileImageLocation,
                                                             services: mechanic.services,
                                                             totalVotes: reviews.count))
                }
            }
        }
    }
}
