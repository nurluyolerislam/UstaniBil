//
//  RegistrationView.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 21.10.2022.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var email = ""
    @State private var username = ""
    @State private var fullname = ""
    @State private var password = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack{
            
            Spacer()
            
            CustomInputField(imageName: "envelope",
                             placeHolderText: "E-Posta",
                             text: self.$email)
            CustomInputField(imageName: "person",
                             placeHolderText: "Ad Soyad",
                             text: self.$fullname)
            CustomInputField(imageName: "person",
                             placeHolderText: "Kullanıcı Adı",
                             text: self.$username)
            CustomSecureField(imageName: "lock",
                              placeHolderText: "Parola",
                              text: self.$password)
            
            Button {
                self.viewModel.register(withEmail: self.email,
                                        password: self.password,
                                        fullname: self.fullname,
                                        username: self.username)
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
        .accentColor(.green)
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
