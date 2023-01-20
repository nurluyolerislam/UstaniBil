//
//  CustomSecureField.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 22.12.2022.
//

import SwiftUI

struct CustomSecureField: View {
    let imageName: String
    let placeHolderText: String
    @State var isSecured: Bool = true
    @Binding var text: String
    
    var body: some View {
        VStack{
            HStack{
                
                Image(systemName: self.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(.darkGray))
                
                if self.isSecured {
                    SecureField(self.placeHolderText,
                                text: self.$text)
                } else {
                    TextField(self.placeHolderText,
                              text: self.$text)
                    .disableAutocorrection(true)
                    .textInputAutocapitalization(.never)
                }
                Button {
                    self.isSecured.toggle()
                } label: {
                    Image(systemName: self.isSecured ? "eye" : "eye.slash")
                        .foregroundColor(Color(.darkGray))
                }
                
            }
            .frame(height: 20)
            
            Divider()
                .background(Color(.darkGray))
        }
    }
}

struct CustomSecureField_Previews: PreviewProvider {
    static var previews: some View {
        CustomSecureField(imageName: "lock",
                          placeHolderText: "Parola",
                          text: .constant(""))
    }
}
