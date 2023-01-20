//
//  ReviewView.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 16.01.2023.
//

import SwiftUI

struct ReviewView: View {
    let mechanic: Mechanic
    @State var text = ""
    @State var score = 0.0
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "person.circle.fill")
                    .font(.system(size: 56))
//                Circle()
//                    .frame(width: 56, height: 56)
                
                Text(self.mechanic.fullName)
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
        .accentColor(.green)
    }
}

struct ReviewView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewView(mechanic: Mechanic(avarageScore: 4.3,
                                      brand: "Renault",
                                      city: "Kahramanmaraş",
                                      company: "Nurluyol A.Ş.",
                                      fullName: "Erislam Nurluyol",
                                      phone: "+905554443322",
                                      totalVote: 3158))
    }
}

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
