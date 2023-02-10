//
//  MechanicDetailViewModel.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 30.01.2023.
//

import Firebase

class MechanicDetailViewModel: ObservableObject{
    let appoinmentService = AppoinmentsService()
    let reviewService = ReviewService()
    
    @Published var showingIndex = 0
    @Published var reviewsForMechanic: [Review] = []
    @Published var avarageScore: Double = 0
    
    func requestAppoinment(date: Date, service: String, mechanicID: String){
        self.appoinmentService.requestAppoinment(date: date,
                                                 service: service,
                                                 mechanicID: mechanicID)
    }
    
    func fetchReviewsForMechanic(mechanicID: String){
        self.reviewService.fetchReviewsForMechanic(mechanicID: mechanicID) { reviews in
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
