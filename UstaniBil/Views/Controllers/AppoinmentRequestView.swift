//
//  AppoinmentRequestView.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 30.01.2023.
//

import SwiftUI

struct AppoinmentRequestView: View {
    
    let viewModel: MechanicDetailViewModel
    let mechanic: Mechanic
    
    @State var selectedService: String = ""
    @State var selectedDate: Date = Date.now
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Form{
            Section{
                
                HStack{
                    Image(systemName: "person")
                    VStack(alignment: .leading){
                        Text(self.mechanic.fullname)
                        Text("Usta")
                            .font(.footnote).foregroundColor(.gray)
                    }
                }
                
                HStack{
                    Image(systemName: "calendar")
                    DatePicker(selection: self.$selectedDate) {
                        VStack(alignment: .leading){
                            Text(self.selectedDate.formatted(Date.FormatStyle().day(.twoDigits).month(.twoDigits).year()).description)
                            Text(self.selectedDate.formatted(Date.FormatStyle().hour(.twoDigits(amPM: .omitted)).minute(.twoDigits)).description)
                                .font(.footnote).foregroundColor(.gray)
                        }
                        .datePickerStyle(.wheel)
                    }
                }
                
                HStack{
                    Image(systemName: "mappin.and.ellipse")
                    VStack(alignment: .leading){
                        Text("Kahramanmaraş")
                        Text("Sana 1 km uzaklıkta")
                            .font(.footnote).foregroundColor(.gray)
                    }
                }
                
            }
            
            Section{
                Picker("İşlem Seçiniz", selection: self.$selectedService) {
                    ForEach(self.mechanic.priceList, id: \.self){ service in
                        Text(service.service).tag(service.service)
                    }
                }
            }
            
            Button {
                self.viewModel.requestAppoinment(date: self.selectedDate,
                                                 description: self.selectedService,
                                                 mechanicID: self.mechanic.id)
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Randevu Talebi Gönder")
            }

        }
    }
}


//struct AppoinmentRequestView_Previews: PreviewProvider {
//    static var previews: some View {
//        AppoinmentRequestView()
//    }
//}
