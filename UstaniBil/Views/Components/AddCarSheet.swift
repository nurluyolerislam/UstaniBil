//
//  AddCarSheet.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 12.06.2023.
//

import SwiftUI
import Kingfisher

struct AddCarSheet: View {
    @ObservedObject var profileViewModel: ProfileViewModel
    @StateObject var viewModel = AddCarSheetViewModel()
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack{
            Picker("Marka", selection: self.$viewModel.selectedBrandID) {
                ForEach(self.viewModel.brands, id: \.id) { brand in
                    HStack{
                        KFImage(URL(string: brand.logoURL))
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text(brand.name)
                    }
                }
            }
            .pickerStyle(.wheel)
            .onChange(of: self.viewModel.selectedBrandID) { newValue in
                self.viewModel.fetchAutomobilesForBrand()
            }
            
            Picker("Model", selection: self.$viewModel.selectedAutomobileID) {
                ForEach(self.viewModel.automobiles, id: \.id) { automobile in
                    Text(automobile.name)
                }
            }
            
            
            Button {
                self.viewModel.addCar()
                self.profileViewModel.fetchUserCars()
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Ekle")
            }

        }
        .pickerStyle(.menu)
        .onAppear {
            self.viewModel.fetchBrands()
        }
    }
}

//struct AddCarSheet_Previews: PreviewProvider {
//    static var previews: some View {
//        AddCarSheet()
//    }
//}
