//
//  MechanicDetailView.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 29.12.2022.
//

import SwiftUI
import Kingfisher

struct MechanicDetailView: View {
    
    let mechanic: Mechanic
    
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
                    Image(systemName: "calendar")
                    
                    Text("En yakın randevu: 14 Mart Salı")
                    
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
                    ForEach(self.mechanic.priceList, id: \.self){ service in
                        HStack{
                            Text(service.service)
                            Spacer()
                            Text("\(service.price) TL")
                                .bold()
                        }
                    }
                }
                
                if self.viewModel.showingIndex == 1{
                    VStack(alignment:.leading ,spacing: 15){
                        
                        HStack(alignment: .top){
                            Image(systemName: "person")
                                .foregroundColor(.accentColor)
                            VStack(alignment: .leading){
                                Text("Usta Hakkında")
                                    .bold()
                                Text(self.mechanic.about)
                            }
                        }

                        HStack(alignment: .top){
                            Image(systemName: "globe")
                                .foregroundColor(.accentColor)
                            VStack(alignment: .leading){
                                Text("Diller")
                                    .bold()
                                Text(self.mechanic.languages.joined(separator: ", "))
                            }
                        }

                        HStack(alignment: .top){
                            Image(systemName: "graduationcap")
                                .foregroundColor(.accentColor)
                            VStack(alignment: .leading){
                                Text("Eğitim")
                                    .bold()
                                Text("Lise")
                            }
                        }

                        HStack(alignment: .top){
                            Image(systemName: "envelope")
                                .foregroundColor(.accentColor)
                            VStack(alignment: .leading){
                                Text("E-Posta")
                                    .bold()
                                Text(self.mechanic.email)
                            }
                        }
                        
                    }
                }
                
                if self.viewModel.showingIndex == 2{
                    VStack(spacing: 15){
                        NavigationLink {
                            ReviewView(mechanic: self.mechanic)
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
                        
                        self.voteView
                        
                        ForEach(self.mechanic.reviews, id: \.self){ review in
                            HStack(alignment: .top){
                                Image(systemName: "person.circle.fill")
                                    .font(.system(size: 32))
                                
                                VStack(alignment: .leading){
                                    Text(review.userID)
                                    
                                    ScoreView(score: Double(review.vote))
                                    
                                    Text(review.comment)
                                        .font(.footnote)
                                }
                                
                                Spacer()
                            }
                        }
                    }
                }
            }
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 20)
                    .stroke()
            }
            
            Spacer()
        }
        .navigationTitle(self.mechanic.fullname)
        .padding()
    }
}

struct MechanicDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MechanicDetailView(mechanic: Mechanic(about: "Marka araçları üzerinde 10 yıllık deneyime sahibim. 4 yıldır elektromekanik alanında çalışıyorum.",
                                              address: "Kahramanmaraş",
                                              avarageScore: 4.5,
                                              brand: "Ford",
                                              company: "Kemak A.Ş.",
                                              education: "Lise",
                                              email: "mehmetozdemir@gmail.com",
                                              fullname: "Mehmet Özdemir",
                                              id: "4guQBJMzd0qevDUPCLSP",
                                              languages: ["Türkçe"],
                                              phone: "+905444444444",
                                              priceList: [Service(service: "aaa", price: 1000)],
                                              profileImageLocation: "gs://ustanibil-3a48d.appspot.com/erislam.jpg",
                                              reviews: [Review(comment: "aaa", userID: "aaa", vote: 5)],
                                              totalVotes: 1287))
    }
}

extension MechanicDetailView{
    var voteView: some View{
        HStack{
            VStack{
                Text("\(self.mechanic.avarageScore, specifier: "%.1f") / 5")
                    .font(.title)
                
                ScoreView(score: self.mechanic.avarageScore)
                
                Text("\(self.mechanic.totalVotes) değerlendirme")
                    .foregroundColor(.gray)
                    .font(.footnote)
            }
            
            VStack(spacing: 0){
                ProgressView("5", value: 0.8)
                ProgressView("4", value: 0.1)
                ProgressView("3", value: 0.0)
                ProgressView("2", value: 0.1)
                ProgressView("1", value: 0.0)
                ProgressView("0", value: 0.0)
            }
            .tint(.green)
            .font(.footnote)
            .foregroundColor(.gray)
            
        }
    }
}

