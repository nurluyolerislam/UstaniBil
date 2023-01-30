//
//  MechanicDetailViewModel.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 30.01.2023.
//

import Foundation

class MechanicDetailViewModel: ObservableObject{
    let appoinmentService = AppoinmentsService()
    let mechanicService = MechanicsService()
    let reviewService = ReviewService()
    
    @Published var showingIndex = 0
    @Published var reviewsForMechanic: [Review] = []
    @Published var avarageScore: Double = 0
    
    func requestAppoinment(date: Date, description: String, mechanicID: String){
        self.appoinmentService.requestAppoinment(date: date,
                                                 description: description,
                                                 mechanicID: mechanicID)
    }
    
    func fetchReviewsForMechanic(mechanicID: String){
        self.mechanicService.fetchReviewsForMechanic(id: mechanicID) { reviews in
            self.reviewsForMechanic = reviews
            self.avarageScore = 0
            reviews.forEach { review in
                self.avarageScore += Double(review.score)
            }
            self.avarageScore /= Double(reviews.count)
        }
    }
    
    func createReviewForMechanic(comment: String, mechanicID: String, score: Int){
        self.reviewService.createReviewForMechanic(comment: comment, mechanicID: mechanicID, score: score)
    }
}
