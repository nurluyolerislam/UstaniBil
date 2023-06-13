//
//  MechanicDetailView.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 29.12.2022.
//

import SwiftUI
import Kingfisher

struct MechanicDetailView: View {
    
    let mechanic: MechanicInAppModel
    
    @StateObject var viewModel = MechanicDetailViewModel()
    
    var body: some View {
        VStack{
            
            HStack{
                
                KFImage(URL(string: self.mechanic.profileImageLocation))
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 84, height: 84)
                
                VStack(alignment: .leading){
                    Text(self.mechanic.fullname)
                    
                    Text(self.mechanic.company)
                    
                    Text(self.mechanic.phone)
                        .font(.footnote)
                }
                
                Spacer()
                
            }
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 20)
                    .stroke()
            }
            
            NavigationLink {
                AppoinmentRequestView(viewModel: self.viewModel, mechanic: self.mechanic)
            } label: {
                Spacer()
                Text("Randevu Oluştur")
                    .bold()
                Spacer()
            }
            .padding(.vertical, 10)
            .foregroundColor(.white)
            .background {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.accentColor)
            }
            
            VStack(spacing: 10){
                HStack{
                    Image(systemName: "mappin.and.ellipse")
                    
                    Text(self.mechanic.address)
                    
                    Spacer()
                }
                
                HStack{
                    Image(systemName: "trophy")
                    
                    Text("\(self.mechanic.brand) Uzmanı")
                    
                    Spacer()
                }
            }
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 20)
                    .stroke()
            }
            
            VStack{
                HStack(spacing: 0){
                    Button {
                        self.viewModel.showingIndex = 0
                    } label: {
                        VStack{
                            Text("Hizmetler")
                            Rectangle()
                                .frame(height: 1)
                        }
                        .foregroundColor(self.viewModel.showingIndex == 0 ? .accentColor : .gray)
                    }
                    
                    Button {
                        self.viewModel.showingIndex = 1
                    } label: {
                        VStack{
                            Text("Detay")
                            Rectangle()
                                .frame(height: 1)
                        }
                        .foregroundColor(self.viewModel.showingIndex == 1 ? .accentColor : .gray)
                    }
                    
                    Button {
                        self.viewModel.showingIndex = 2
                    } label: {
                        VStack{
                            Text("Yorumlar")
                            Rectangle()
                                .frame(height: 1)
                        }
                        .foregroundColor(self.viewModel.showingIndex == 2 ? .accentColor : .gray)
                    }
                    
                }
                
                if self.viewModel.showingIndex == 0{
                    ForEach(self.mechanic.services, id: \.self){ service in
                        HStack{
                            Text(service.service)
                            Spacer()
                            Text("\(service.price) TL")
                                .bold()
                        }
                    }
                }
                
                if self.viewModel.showingIndex == 1{
                    VStack(spacing: 15){
                        
                        HStack(alignment: .top){
                            Image(systemName: "person")
                                .foregroundColor(.accentColor)
                            VStack(alignment: .leading){
                                Text("Usta Hakkında")
                                    .bold()
                                Text(self.mechanic.about)
                            }
                            Spacer()
                        }

                        HStack(alignment: .top){
                            Image(systemName: "globe")
                                .foregroundColor(.accentColor)
                            VStack(alignment: .leading){
                                Text("Diller")
                                    .bold()
                                Text(self.mechanic.languages.joined(separator: ", "))
                            }
                            Spacer()
                        }

                        HStack(alignment: .top){
                            Image(systemName: "graduationcap")
                                .foregroundColor(.accentColor)
                            VStack(alignment: .leading){
                                Text("Eğitim")
                                    .bold()
                                Text("Lise")
                            }
                            Spacer()
                        }

                        HStack(alignment: .top){
                            Image(systemName: "envelope")
                                .foregroundColor(.accentColor)
                            VStack(alignment: .leading){
                                Text("E-Posta")
                                    .bold()
                                Text(self.mechanic.email)
                            }
                            Spacer()
                        }
                        
                    }
                }
                
                if self.viewModel.showingIndex == 2{
                    VStack(spacing: 15){
                        NavigationLink {
                            ReviewView(mechanic: self.mechanic, viewModel: self.viewModel)
                        } label: {
                            Spacer()
                            Text("Deneyimini Paylaş")
                                .bold()
                            Spacer()
                        }
                        .foregroundColor(.accentColor)
                        .padding(5)
                        .background {
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(lineWidth: 2)
                                .foregroundColor(.accentColor)
                        }
                        
                        if viewModel.totalVotes != 0 {
                            self.voteView
                        }
                        
                        ScrollView{
                            ForEach(self.viewModel.reviewsForMechanic, id: \.id){ review in
                                HStack(alignment: .top){
                                    KFImage(URL(string: review.userProfileImageLocation))
                                        .resizable()
                                        .clipShape(Circle())
                                        .frame(width: 32, height: 32)

                                    VStack(alignment: .leading){
                                        Text(review.userFullname)

                                        ScoreView(score: Double(review.score))

                                        Text(review.comment)
                                            .font(.footnote)
                                    }
                                    Spacer()
                                }
                            }
                        }
                    }
                    //
                }
            }
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 20)
                    .stroke()
            }
            
            Spacer()
        }
        .onAppear {
            self.viewModel.fetchReviewsForMechanic(mechanicID: self.mechanic.id)
        }
        .onDisappear{
            self.viewModel.removeReviews()
        }
        .navigationTitle(self.mechanic.fullname)
        .padding()
    }
}

//struct MechanicDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        MechanicDetailView(mechanic: Mechanic(about: "Marka araçları üzerinde 10 yıllık deneyime sahibim. 4 yıldır elektromekanik alanında çalışıyorum.",
//                                              address: "Kahramanmaraş",
//                                              avarageScore: 4.5,
//                                              brand: "Ford",
//                                              company: "Kemak A.Ş.",
//                                              education: "Lise",
//                                              email: "mehmetozdemir@gmail.com",
//                                              fullname: "Mehmet Özdemir",
//                                              id: "4guQBJMzd0qevDUPCLSP",
//                                              languages: ["Türkçe"],
//                                              phone: "+905444444444",
//                                              profileImageLocation: "gs://ustanibil-3a48d.appspot.com/erislam.jpg",
//                                              services: [Service(price: 1000, service: "aaa")],
//                                              totalVotes: 1287))
//    }
//}

extension MechanicDetailView{
    var voteView: some View{
        HStack{
            VStack{
                Text("\(self.viewModel.avarageScore, specifier: "%.1f") / 5")
                    .font(.title)
                
                ScoreView(score: self.viewModel.avarageScore)
                
                Text("\(self.viewModel.totalVotes) değerlendirme")
                    .foregroundColor(.gray)
                    .font(.footnote)
            }
            
            VStack(spacing: 0){
                ProgressView("5", value: self.viewModel.scores[5] / Double(self.viewModel.totalVotes))
                ProgressView("4", value: self.viewModel.scores[4] / Double(self.viewModel.totalVotes))
                ProgressView("3", value: self.viewModel.scores[3] / Double(self.viewModel.totalVotes))
                ProgressView("2", value: self.viewModel.scores[2] / Double(self.viewModel.totalVotes))
                ProgressView("1", value: self.viewModel.scores[1] / Double(self.viewModel.totalVotes))
                ProgressView("0", value: self.viewModel.scores[0] / Double(self.viewModel.totalVotes))
            }
            .tint(.green)
            .font(.footnote)
            .foregroundColor(.gray)
            
        }
    }
}

