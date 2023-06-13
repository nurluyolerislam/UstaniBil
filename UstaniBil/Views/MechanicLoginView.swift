//
//  MechanicLoginView.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 3.06.2023.
//

import SwiftUI

struct MechanicLoginView: View {
    @State var email = ""
    @State var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack{
            
            Text("USTANI BİL")
                .font(.largeTitle).bold()
                .foregroundColor(.accentColor)
            
            Text("Usta Girişi")
                .font(.body)
                .foregroundColor(.accentColor)
            
            Spacer()
            
            CustomInputField(imageName: "envelope",
                             placeHolderText: "E-Posta",
                             text: self.$email)
            CustomSecureField(imageName: "lock",
                              placeHolderText: "Parola",
                              text: self.$password)
            Button {
                self.viewModel.loginAsMechanic(withEmail: self.email,
                                               password: self.password)
            } label: {
                Text("Giriş Yap")
            }
            
            Spacer()
            
            NavigationLink {
                MechanicRegistrationView()
            } label: {
                Text("Usta Hesabı Oluştur")
            }
            .padding(.bottom)
            
            Button {
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Müşteri Olarak Giriş Yap")
            }
            
        }
        .padding()
        .navigationBarBackButtonHidden()
    }
}

struct MechanicLoginView_Previews: PreviewProvider {
    static var previews: some View {
        MechanicLoginView()
    }
}
