//
//  HomeView.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 13.12.2022.
//

import SwiftUI

struct HomeView: View {
    @State var searchText: String = ""
    
    let mechanics: [Mechanic] = [
        Mechanic(avarageScore: 5,
                 brand: "Ford",
                 city: "Kahramanmaraş",
                 company: "Kemak",
                 fullName: "Mehmet Özdemir",
                 phone: "+90 544 444 44 44",
                 totalVote: 1076),
        Mechanic(avarageScore: 5,
                 brand: "Ford",
                 city: "Kahramanmaraş",
                 company: "Otosan",
                 fullName: "Ahmet Yılmaz",
                 phone: "+90 555 555 55 55",
                 totalVote: 784),
        Mechanic(avarageScore: 4.3,
                 brand: "Ford",
                 city: "Kahramanmaraş",
                 company: "Borusan",
                 fullName: "Turan Kaya",
                 phone: "+90 533 333 33 33",
                 totalVote: 458)
    ]
    
    var body: some View {
        VStack{
            Text("Ustanı Bil")
                .font(.title)
            
            CustomSearchBar(text: self.$searchText)
                .padding(.bottom, 20)
            
            if self.searchText.isEmpty{
                self.recommendedMechanics
            } else {
                ScrollView{
                    ForEach(self.mechanics.filter { $0.fullName.lowercased().contains(self.searchText.lowercased()) }){ mechanic in
                        NavigationLink {
                            MechanicDetailView(mechanic: mechanic)
                        } label: {
                            MechanicCell(mechanic: mechanic)
                        }
                        .foregroundColor(.black)
                        .padding(1)
                    }
                }
            }
            
            Spacer()
        }
        .padding()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

extension HomeView{
    var recommendedMechanics: some View{
        Group{
            Text("Sizin İçin Önerilen")
                .font(.title3)
                .bold()
            
                NavigationLink {
                    MechanicDetailView(mechanic: Mechanic(avarageScore: 4.3,
                                                          brand: "Ford",
                                                          city: "Kahramanmaraş",
                                                          company: "Borusan",
                                                          fullName: "Turan Kaya",
                                                          phone: "+90 533 333 33 33",
                                                          totalVote: 458))
                } label: {
                    MechanicCell(mechanic: Mechanic(avarageScore: 4.3,
                                                    brand: "Ford",
                                                    city: "Kahramanmaraş",
                                                    company: "Borusan",
                                                    fullName: "Turan Kaya",
                                                    phone: "+90 533 333 33 33",
                                                    totalVote: 458))
                }
                .foregroundColor(.black)
            
            Text("Konumunuzda Önerilenler")
                .font(.title3)
                .bold()
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(self.mechanics, id: \.self) { mechanic in
                        NavigationLink {
                            MechanicDetailView(mechanic: mechanic)
                        } label: {
                            MechanicCell(mechanic: mechanic)
                        }
                        .foregroundColor(.black)
                    }
                }
                .padding(1)
            }
            
            Text("Bugün Müsait Olanlar")
                .font(.title3)
                .bold()
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(self.mechanics, id: \.self) { mechanic in
                        NavigationLink {
                            MechanicDetailView(mechanic: mechanic)
                        } label: {
                            MechanicCell(mechanic: mechanic)
                        }
                        .foregroundColor(.black)
                    }
                }
                .padding(1)
            }
        }
    }
}
