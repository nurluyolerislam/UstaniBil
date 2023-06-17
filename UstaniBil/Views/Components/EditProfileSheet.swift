//
//  EditProfileSheet.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 14.06.2023.
//

import SwiftUI

struct EditProfileSheet: View {
    
    @State var email = ApplicationVariables.userEmail
    @State var fullname = ApplicationVariables.userFullname
    @State var address = ApplicationVariables.userAddress
    @State var phone = ApplicationVariables.userPhone
    @EnvironmentObject var authViewModel: AuthViewModel
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var profileViewModel: ProfileViewModel
    
    var body: some View {
        VStack{
            CustomInputField(imageName: "envelope",
                             placeHolderText: "E-Posta",
                             text: self.$email)
            CustomInputField(imageName: "person",
                             placeHolderText: "Ad Soyad",
                             text: self.$fullname)
            CustomInputField(imageName: "mappin.and.ellipse",
                             placeHolderText: "Adres",
                             text: self.$address)
            CustomInputField(imageName: "phone",
                             placeHolderText: "Telefon Numarası",
                             text: self.$phone)
            
            Button {
                self.profileViewModel.userService.updateUser(email: self.email,fullname: self.fullname, address: self.address, phone: self.phone)
                self.authViewModel.fetchUser()
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

//struct EditProfileSheet_Previews: PreviewProvider {
//    static var previews: some View {
//        EditProfileSheet()
//    }
//}
