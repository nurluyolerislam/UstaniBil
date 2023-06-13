//
//  MechanicRegistrationDetailView.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 3.06.2023.
//

import SwiftUI

struct MechanicRegistrationDetailView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    @Binding var email: String
    @Binding var password: String
    @Binding var fullname: String
    @State var address: String = ""
    @State var about: String = ""
    @State var brand: String = ""
    @State var company: String = ""
    @State var education: String = ""
    @State var languages: String = ""
    @State var phone: String = ""
    
    var body: some View {
        VStack{
            CustomInputField(imageName: "mappin.and.ellipse",
                             placeHolderText: "Adres",
                             text: self.$address)
            CustomInputField(imageName: "person",
                             placeHolderText: "Hakkında",
                             text: self.$about)
            CustomInputField(imageName: "car",
                             placeHolderText: "Marka",
                             text: self.$brand)
            CustomInputField(imageName: "building",
                             placeHolderText: "Şirket",
                             text: self.$company)
            CustomInputField(imageName: "graduationcap",
                             placeHolderText: "Eğitim",
                             text: self.$education)
            CustomInputField(imageName: "globe",
                             placeHolderText: "Diller",
                             text: self.$languages)
            CustomInputField(imageName: "phone",
                             placeHolderText: "Telefon Numarası",
                             text: self.$phone)
            
            Button {
                self.viewModel.registerMechanic(email: self.email,
                                                password: self.password,
                                                fullname: self.fullname,
                                                address: self.address,
                                                about: self.about,
                                                brand: self.brand,
                                                company: self.company,
                                                education: self.education,
                                                languages: self.languages,
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

