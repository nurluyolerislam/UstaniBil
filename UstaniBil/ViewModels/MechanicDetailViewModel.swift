//
//  MechanicDetailViewModel.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 30.01.2023.
//

import Firebase
import SwiftUI

class MechanicDetailViewModel: ObservableObject{
    let appoinmentService = AppoinmentsService()
    let reviewService = ReviewService()
    let userService = UserService()
    
    @Published var showingIndex = 0
    @Published var reviewsForMechanic: [ReviewInAppModel] = []
    @Published var avarageScore: Double = 0
    @Published var totalVotes: Int = 0
    
    func requestAppoinment(date: Date, service: String, mechanicID: String){
        self.appoinmentService.requestAppoinment(date: date,
                                                 service: service,
                                                 mechanicID: mechanicID)
    }
    
    func fetchReviewsForMechanic(mechanicID: String){
        self.reviewService.fetchReviewsForMechanic(mechanicID: mechanicID) { reviews in
            reviews.forEach { review in
                self.userService.fetchUser(withRef: review.userRef) { user in
                    self.reviewsForMechanic.append(ReviewInAppModel(comment: review.comment,
                                                                    id: review.id,
                                                                    score: review.score,
                                                                    userFullname: user.fullname,
                                                                    userProfileImageLocation: user.profileImageLocation))
                }
            }
            self.totalVotes = reviews.count
            self.avarageScore = 0
            reviews.forEach { review in
                self.avarageScore += Double(review.score)
            }
            self.avarageScore /= Double(reviews.count)
        }
    }
    
    func removeReviews(){
        self.reviewsForMechanic.removeAll()
    }
    
    func createReviewForMechanic(comment: String, mechanicID: String, score: Int){
        self.reviewService.createReviewForMechanic(comment: comment, mechanicID: mechanicID, score: score)
    }
    
}
