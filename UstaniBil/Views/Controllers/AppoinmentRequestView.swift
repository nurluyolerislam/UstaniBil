//
//  AppoinmentRequestView.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 30.01.2023.
//

import SwiftUI

struct AppoinmentRequestView: View {
    
    let viewModel: MechanicDetailViewModel
    let mechanic: MechanicInAppModel
    
    @State var selectedService = "Listede Yok"
    @State var selectedDate: Date = Calendar.current.date(byAdding: .hour, value: 2, to: Date()) ?? Date.now
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Form{
            Section{
                
                HStack{
                    Image(systemName: "person")
                        .foregroundColor(.accentColor)
                    VStack(alignment: .leading){
                        Text(self.mechanic.fullname)
                        Text("Usta")
                            .font(.footnote).foregroundColor(.gray)
                    }
                }
                
                HStack{
                    Image(systemName: "calendar")
                        .foregroundColor(.accentColor)
                    DatePicker( "Randevu Tarihi Seç",
                                selection: self.$selectedDate,
                                in: Date()...,
                                displayedComponents: [.date, .hourAndMinute])
                }
                
                HStack{
                    Image(systemName: "mappin.and.ellipse")
                        .foregroundColor(.accentColor)
                    VStack(alignment: .leading){
                        Text("Kahramanmaraş")
                        Text("Sana 1 km uzaklıkta")
                            .font(.footnote).foregroundColor(.gray)
                    }
                }
                
            }
            
            Section{
                Picker("İşlem Seçiniz", selection: self.$selectedService) {
                    Text("Listede Yok").tag("Listede Yok")
                    ForEach(self.mechanic.services, id: \.self){ service in
                        Text(service.service).tag(service.service)
                    }
                }
            }
            
            Button {
                self.viewModel.requestAppoinment(date: self.selectedDate,
                                                 service: self.selectedService,
                                                 mechanicID: self.mechanic.id)
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Randevu Talebini Onayla")
            }
            
        }
    }
}


//struct AppoinmentRequestView_Previews: PreviewProvider {
//    static var previews: some View {
//        AppoinmentRequestView(viewModel: MechanicDetailViewModel(),
//                              mechanic: Mechanic(about: "Marka araçları üzerinde 10 yıllık deneyime sahibim. 4 yıldır elektromekanik alanında çalışıyorum.",
//                                                 address: "Kahramanmaraş",
//                                                 avarageScore: 4.5,
//                                                 brand: "Ford",
//                                                 company: "Kemak A.Ş.",
//                                                 education: "Lise",
//                                                 email: "mehmetozdemir@gmail.com",
//                                                 fullname: "Mehmet Özdemir",
//                                                 id: "4guQBJMzd0qevDUPCLSP",
//                                                 languages: ["Türkçe"],
//                                                 phone: "+905444444444",
//                                                 profileImageLocation: "gs://ustanibil-3a48d.appspot.com/erislam.jpg",
//                                                 services: [Service(service: "aaa", price: 1000)],
//                                                 totalVotes: 1287))
//    }
//}
