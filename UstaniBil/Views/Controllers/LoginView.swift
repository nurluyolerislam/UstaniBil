//
//  LoginView.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 21.10.2022.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack{
            
            Text("USTANI BİL")
                .font(.largeTitle).bold()
                .foregroundColor(.accentColor)
            
            Spacer()
            
            CustomInputField(imageName: "envelope",
                             placeHolderText: "E-Posta",
                             text: self.$email)
            CustomSecureField(imageName: "lock",
                              placeHolderText: "Parola",
                              text: self.$password)
            Button {
                self.viewModel.login(withEmail: self.email,
                                     password: self.password)
            } label: {
                Text("Giriş Yap")
            }
            
            Spacer()
            
            NavigationLink {
                RegistrationView()
            } label: {
                Text("Hesap Oluştur")
            }

        }
        .padding()
        .accentColor(.green)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
