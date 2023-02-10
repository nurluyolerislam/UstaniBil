//
//  ReviewView.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 16.01.2023.
//

import SwiftUI
import Kingfisher

struct ReviewView: View {
    
    let mechanic: Mechanic
    let viewModel: MechanicDetailViewModel
    
    @State var text = ""
    @State var score = 0
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack{
            HStack{
                KFImage(URL(string: self.mechanic.profileImageLocation))
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 56, height: 56)
                
                Text(self.mechanic.fullname)
                    .bold()
                
                Spacer()
            }
                     
            Divider()
            
            VStack(alignment: .leading){
                Text("Bir Yorum Bırak")
                TextField("Deneyimini Anlat.." ,text: self.$text, axis: .vertical)
                    .multilineTextAlignment(.leading)
                    .lineLimit(3)
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(lineWidth: 2)
                    }
            }
            
            Divider()
            
            self.voteView
            
            Spacer()
            
            Button {
                self.viewModel.createReviewForMechanic(comment: self.text,
                                                       mechanicID: self.mechanic.id,
                                                       score: self.score)
                self.presentationMode.wrappedValue.dismiss()
            }  label: {
                Spacer()
                Text("Paylaş")
                    .bold()
                Spacer()
            }
            .padding(.vertical, 10)
            .foregroundColor(.white)
            .background {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.accentColor)
            }
        }
        .navigationTitle("Deneyimini Paylaş")
        .padding()
    }
}

//struct ReviewView_Previews: PreviewProvider {
//    static var previews: some View {
//        ReviewView(mechanic: Mechanic(about: "Marka araçları üzerinde 10 yıllık deneyime sahibim. 4 yıldır elektromekanik alanında çalışıyorum.",
//                                      address: "Kahramanmaraş",
//                                      avarageScore: 4.5,
//                                      brand: "Ford",
//                                      company: "Kemak A.Ş.",
//                                      education: "Lise",
//                                      email: "mehmetozdemir@gmail.com",
//                                      fullname: "Mehmet Özdemir",
//                                      id: "4guQBJMzd0qevDUPCLSP",
//                                      languages: ["Türkçe"],
//                                      phone: "+905444444444",
//                                      profileImageLocation: "gs://ustanibil-3a48d.appspot.com/erislam.jpg",
//                                      services: [Service(service: "aaa", price: 1000)],
//                                      totalVotes: 1287))
//    }
//}

extension ReviewView{
    var voteView: some View{
        HStack{
            Button {
                self.score = 1
            } label: {
                Image(systemName: self.score >= 1  ? "wrench.adjustable.fill" : "wrench.adjustable")
            }
            
            Button {
                self.score = 2
            } label: {
                Image(systemName: self.score >= 2  ? "wrench.adjustable.fill" : "wrench.adjustable")
            }
            
            Button {
                self.score = 3
            } label: {
                Image(systemName: self.score >= 3  ? "wrench.adjustable.fill" : "wrench.adjustable")
            }
            
            Button {
                self.score = 4
            } label: {
                Image(systemName: self.score >= 4  ? "wrench.adjustable.fill" : "wrench.adjustable")
            }
            
            Button {
                self.score = 5
            } label: {
                Image(systemName: self.score == 5 ? "wrench.adjustable.fill" : "wrench.adjustable")
            }
        }
        .font(.largeTitle)
    }
}
