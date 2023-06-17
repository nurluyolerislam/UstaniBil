//
//  AppoinmentCell.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 29.01.2023.
//

import SwiftUI

struct AppoinmentCell: View{
    
    let appoinment: Appoinment
    @StateObject var viewModel = AppoinmentCellViewModel()
    @ObservedObject var appoinmentsViewModel: AppoinmentsViewModel
    
    var body: some View{
        HStack(alignment: .top){
            
            VStack(alignment: .leading){
                
                if self.appoinment.status == "confirmed"{
                    Text("Onaylandı")
                        .modifier(AppoinmentStatusModifier())
                }
                if self.appoinment.status == "waiting"{
                    Text("Onay Bekliyor")
                        .modifier(AppoinmentStatusModifier())
                }
                if self.appoinment.status == "finished"{
                    Text("Tamamlandı")
                        .modifier(AppoinmentStatusModifier())
                }
                if self.appoinment.status == "rejected"{
                    Text("Reddedildi")
                        .modifier(AppoinmentStatusModifier())
                }
                    
                Text(self.appoinment.service)
                    .bold()
                
                Text(self.viewModel.mechanicName)
                    .font(.footnote)
                    .onAppear {
                        self.viewModel.fetchMechanicNameFromMechanicReference(ref: self.appoinment.mechanicRef)
                    }
            }
            
            Spacer()
            
            VStack{
                
                if self.appoinment.status == "waiting" {
                    Button {
                        self.viewModel.removeAppointment(appointmentID: self.appoinment.id)
                        self.appoinmentsViewModel.fetchAppoinments()
                    } label: {
                        Text("Kaldır")
                            .padding(.horizontal, 10)
                            .background {
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke()
                            }
                    }
                    .foregroundColor(.red)
                    .buttonStyle(.plain)
                    .padding(.bottom, 10)
                }
                
                Text(self.appoinment.date.dateValue().formatted(Date.FormatStyle().day(.twoDigits).month(.twoDigits).year()).description)
                    .bold()
                
                Text(self.appoinment.date.dateValue().formatted(Date.FormatStyle().hour(.twoDigits(amPM: .omitted)).minute(.twoDigits)).description)
                    .font(.footnote)
            }
        }
    }
}

//struct AppoinmentCell_Previews: PreviewProvider {
//    static var previews: some View {
//        AppoinmentCell()
//    }
//}

struct AppoinmentStatusModifier: ViewModifier{
    func body(content: Content) -> some View {
        content
            .foregroundColor(.accentColor)
            .padding(.horizontal, 10)
            .background {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.gray)
            }
            .padding(.bottom, 10)
    }
}
