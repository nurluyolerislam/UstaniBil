//
//  CustomInputField.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 21.10.2022.
//

import SwiftUI

struct CustomInputField: View {
    let imageName: String
    let placeHolderText: String
    @Binding var text: String
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: self.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(.darkGray))
                 
                    TextField(self.placeHolderText,
                              text: self.$text)
                    .disableAutocorrection(true)
                    .textInputAutocapitalization(.never)
            }
            .frame(height: 20)
            
            Divider()
                .background(Color(.darkGray))
        }
    }
}

struct CustomInputField_Previews: PreviewProvider {
    static var previews: some View {
        CustomInputField(imageName: "envelope",
                         placeHolderText: "E-Posta",
                         text: .constant(""))
    }
}
