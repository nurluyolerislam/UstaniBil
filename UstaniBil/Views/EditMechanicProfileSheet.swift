//
//  EditMechanicProfileSheet.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 15.06.2023.
//

import SwiftUI

struct EditMechanicProfileSheet: View {
    
    @State var about = ApplicationVariables.mechanicAbout
    @State var company = ApplicationVariables.mechanicCompany
    @State var education = ApplicationVariables.mechanicEducation
    @State var email = ApplicationVariables.userEmail
    @State var fullname = ApplicationVariables.userFullname
    @State var address = ApplicationVariables.userAddress
    @State var phone = ApplicationVariables.userPhone
    @EnvironmentObject var authViewModel: AuthViewModel
    @ObservedObject var mechanicProfileViewModel: MechanicProfileViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack{
            CustomInputField(imageName: "person",
                             placeHolderText: "Ad Soyad",
                             text: self.$fullname)
            CustomInputField(imageName: "envelope",
                             placeHolderText: "E-Posta",
                             text: self.$email)
            CustomInputField(imageName: "phone",
                             placeHolderText: "Telefon Numarası",
                             text: self.$phone)
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
            Button {
                
                self.mechanicProfileViewModel.mechanicService.updateMechanic(about: self.about,
                                                                             company: self.company,
                                                                             education: self.education,
                                                                             email: self.email,
                                                                             fullname: self.fullname,
                                                                             address: self.address,
                                                                             phone: self.phone)
                self.authViewModel.fetchMechanic()
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Değişiklikleri Kaydet")
            }
            .padding(.bottom)
            
            Button {
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Vazgeç")
            }

        }
        .foregroundColor(.accentColor)
        .padding()
    }
}

//struct EditMechanicProfileSheet_Previews: PreviewProvider {
//    static var previews: some View {
//        EditMechanicProfileSheet()
//    }
//}
