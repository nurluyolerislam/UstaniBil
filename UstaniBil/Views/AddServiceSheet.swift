//
//  AddServiceSheet.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 15.06.2023.
//

import SwiftUI

struct AddServiceSheet: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var mechanicProfileViewModel: MechanicProfileViewModel
    @State var service = ""
    @State var price = ""
    
    var body: some View {
        VStack{
            CustomInputField(imageName: "wrench.adjustable", placeHolderText: "Hizmet", text: self.$service)
            CustomInputField(imageName: "banknote", placeHolderText: "Fiyat", text: self.$price)
            
            HStack{
                Button {
                    self.mechanicProfileViewModel.mechanicService.addService(service: Service(price: Int(self.price) ?? 0, service: self.service))
                    self.mechanicProfileViewModel.fetchMechanicServices()
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Ekle")
                        .foregroundColor(.white)
                        .padding(6)
                        .background {
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(.accentColor)
                        }
                }
                .buttonStyle(.plain)
                
                Button {
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Vazgeç")
                        .foregroundColor(.white)
                        .padding(6)
                        .background {
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(.accentColor)
                        }
                }
                .buttonStyle(.plain)
            }
        }
        .padding()
        .accentColor(.green)
    }
}

//struct AddServiceSheet_Previews: PreviewProvider {
//    static var previews: some View {
//        AddServiceSheet()
//    }
//}
