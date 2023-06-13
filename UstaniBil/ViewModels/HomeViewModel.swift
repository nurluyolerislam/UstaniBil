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
    
    @Published var searchText: String = ""
    @Published var mechanics: [MechanicInAppModel] = []
    
    func fetchMechanics(){
        self.mechanics.removeAll()
        self.service.fetchMechanics { mechanics in
            mechanics.forEach { mechanic in
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
                                                             languages: mechanic.languages,
                                                             phone: mechanic.phone,
                                                             profileImageLocation: mechanic.profileImageLocation,
                                                             services: mechanic.services,
                                                             totalVotes: reviews.count))
                }
            }
        }
    }
}
