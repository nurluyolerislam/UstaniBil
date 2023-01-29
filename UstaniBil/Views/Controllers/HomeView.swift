//
//  HomeView.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 13.12.2022.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        VStack{
            Text("Ustanı Bil")
                .font(.title)
            
            CustomSearchBar(text: self.$viewModel.searchText)
                .padding(.bottom, 20)
            
            if self.viewModel.searchText.isEmpty{
                self.recommendedMechanics
            } else {
                ScrollView{
                    ForEach(self.viewModel.mechanics.filter { $0.fullname.lowercased().contains(self.viewModel.searchText.lowercased()) }){ mechanic in
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
        .onAppear {
            self.viewModel.fetchMechanics()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

extension HomeView{
    var recommendedMechanics: some View{
        VStack{
            Text("Sizin İçin Önerilen")
                .font(.title3)
                .bold()
            
            if let mechanic = self.viewModel.mechanics.first{
                NavigationLink {
                    MechanicDetailView(mechanic: mechanic)
                } label: {
                    MechanicCell(mechanic: mechanic)
                }
                    .foregroundColor(.black)
            }
            
            
            Text("Konumunuzda Önerilenler")
                .font(.title3)
                .bold()
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack{
                    ForEach(self.viewModel.mechanics, id: \.self) { mechanic in
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
                    ForEach(self.viewModel.mechanics, id: \.self) { mechanic in
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
