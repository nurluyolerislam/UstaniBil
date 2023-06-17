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
            .pickerStyle(.menu)
            
            
            HStack{
                Button {
                    self.viewModel.addCar()
                    self.profileViewModel.fetchUserCars()
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Ekle")
                        .foregroundColor(.white)
                        .padding(6)
                        .background {
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(.accentColor)
                        }
                }
                
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Vazgeç")
                        .foregroundColor(.white)
                        .padding(6)
                        .background {
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(.accentColor)
                        }
                }
            }
            .buttonStyle(.plain)


        }
        .accentColor(.green)
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
