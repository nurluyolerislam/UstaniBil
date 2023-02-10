//
//  MechanicRegistrationDetailView.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 4.02.2023.
//

import SwiftUI

struct MechanicRegistrationDetailView: View {
    
    @Binding var email: String
    @Binding var password: String
    @Binding var fullname: String
    @State var address: String = ""
    @State var about: String = ""
    @State var brand: String = ""
    @State var company: String = ""
    @State var education: String = ""
    @State var languages: String = ""
    
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
            
        }
    }
}

//struct MechanicRegistrationDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        MechanicRegistrationDetailView()
//    }
//}
