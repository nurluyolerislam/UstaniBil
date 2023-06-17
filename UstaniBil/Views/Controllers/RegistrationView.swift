//
//  RegistrationView.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 21.10.2022.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var email = ""
    @State private var fullname = ""
    @State private var password = ""
    @State private var address = ""
    @State private var phone = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack{
            NavigationLink(isActive: self.$viewModel.didAuthenticateUser) {
                ProfilePhotoSelectorView()
            } label: {
                EmptyView()
            }
            
            Spacer()
            
            Group{
                CustomInputField(imageName: "envelope",
                                 placeHolderText: "E-Posta",
                                 text: self.$email)
                CustomInputField(imageName: "person",
                                 placeHolderText: "Ad Soyad",
                                 text: self.$fullname)
                CustomSecureField(imageName: "lock",
                                  placeHolderText: "Parola",
                                  text: self.$password)
                CustomInputField(imageName: "mappin.and.ellipse",
                                 placeHolderText: "Adres",
                                 text: self.$address)
                CustomInputField(imageName: "phone",
                                 placeHolderText: "Telefon Numarası",
                                 text: self.$phone)
            }
            
            Button {
                self.viewModel.register(email: self.email,
                                        password: self.password,
                                        address: self.address,
                                        fullname: self.fullname,
                                        phone: self.phone)
            } label: {
                Text("Kayıt Ol")
            }
            
            Spacer()
            
            Button {
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Zaten Bir Hesabın Var Mı?")
            }


        }
        .navigationBarBackButtonHidden(true)
        .padding()
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
