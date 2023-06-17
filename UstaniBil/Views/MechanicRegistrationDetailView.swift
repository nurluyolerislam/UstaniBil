//
//  MechanicRegistrationDetailView.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 3.06.2023.
//

import SwiftUI
import Kingfisher

struct MechanicRegistrationDetailView: View {
    
    @EnvironmentObject var authViewModel: AuthViewModel
    @StateObject var viewModel = MechanicRegistrationDetailViewModel()
    
    @Binding var email: String
    @Binding var password: String
    @Binding var fullname: String
    @State var address: String = ""
    @State var about: String = ""
    @State var company: String = ""
    @State var education: String = ""
    @State var phone: String = ""
    
    var body: some View {
        VStack{
            
            NavigationLink(isActive: self.$authViewModel.didAuthenticateUser) {
                ProfilePhotoSelectorView()
            } label: {
                EmptyView()
            }
            
            CustomInputField(imageName: "mappin.and.ellipse",
                             placeHolderText: "Adres",
                             text: self.$address)
            CustomInputField(imageName: "person",
                             placeHolderText: "Hakkında",
                             text: self.$about)
            CustomInputField(imageName: "building",
                             placeHolderText: "Şirket",
                             text: self.$company)
            CustomInputField(imageName: "graduationcap",
                             placeHolderText: "Eğitim",
                             text: self.$education)
            CustomInputField(imageName: "phone",
                             placeHolderText: "Telefon Numarası",
                             text: self.$phone)
            Picker("Marka", selection: self.$viewModel.selectedBrandID) {
                Text("Marka Seçiniz")
                ForEach(self.viewModel.brands, id: \.id) { brand in
                    Text(brand.name)
                }
            }
            .pickerStyle(.menu)
            .onAppear {
                self.viewModel.fetchBrands()
            }
            
            Button {
                self.authViewModel.registerMechanic(email: self.email,
                                                    password: self.password,
                                                    fullname: self.fullname,
                                                    address: self.address,
                                                    about: self.about,
                                                    brand: self.viewModel.selectedBrandName,
                                                    brandID: self.viewModel.selectedBrandID,
                                                    company: self.company,
                                                    education: self.education,
                                                    phone: self.phone)
            } label: {
                Text("Kayıt Ol")
            }
            
            
        }
        .padding()
    }
}

//struct MechanicRegistrationDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        MechanicRegistrationDetailView()
//    }
//}

