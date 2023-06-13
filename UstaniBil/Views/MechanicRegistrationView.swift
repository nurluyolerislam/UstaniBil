//
//  MechanicRegistrationView.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 3.06.2023.
//

import SwiftUI

struct MechanicRegistrationView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State var fullname: String = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack{
            
            Spacer()
            
            Group{
                CustomInputField(imageName: "envelope",
                                 placeHolderText: "E-Posta",
                                 text: self.$email)
                CustomSecureField(imageName: "lock",
                                  placeHolderText: "Parola",
                                  text: self.$password)
                CustomInputField(imageName: "person",
                                 placeHolderText: "Ad Soyad",
                                 text: self.$fullname)
            }
            
            NavigationLink {
                MechanicRegistrationDetailView(email: self.$email,
                                               password: self.$password,
                                               fullname: self.$fullname)
            } label: {
                Text("Devam Et")
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

struct MechanicRegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        MechanicRegistrationView()
    }
}
