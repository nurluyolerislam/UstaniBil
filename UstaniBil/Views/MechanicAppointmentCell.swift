//
//  MechanicAppointmentCell.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 7.06.2023.
//

import SwiftUI

struct MechanicAppointmentCell: View {
    
    let appointment: Appoinment
    @StateObject var viewModel = MechanicAppoinmentCellViewModel()
    @ObservedObject var mechanicAppointmentsViewModel : MechanicAppointmentsViewModel
    
    var body: some View {
        HStack(alignment: .top){
            
            VStack(alignment: .leading){
                
                if self.appointment.status == "confirmed"{
                    Text("Onaylandı")
                        .modifier(AppoinmentStatusModifier())
                }
                if self.appointment.status == "waiting"{
                    Text("Onay Bekliyor")
                        .modifier(AppoinmentStatusModifier())
                }
                if self.appointment.status == "finished"{
                    Text("Tamamlandı")
                        .modifier(AppoinmentStatusModifier())
                }
                    
                Text(self.appointment.service)
                    .bold()
                
                Text(self.viewModel.userFullname)
                    .font(.footnote)
                    .onAppear {
                        self.viewModel.fetchUserFullnameFromUserReference(ref: self.appointment.userRef)
                    }
                
                Text("(\(appointment.carModel))")
                    .font(.footnote)
            }
            
            Spacer()
            
            VStack{
                
                if self.appointment.status == "waiting" {
                    HStack{
                        
                        Button {
                            self.viewModel.confirmAppointment(appointmentID: self.appointment.id)
                            self.mechanicAppointmentsViewModel.fetchAppointments()
                        } label: {
                            Text("Onayla")
                                .font(.footnote)
                                .padding(.horizontal, 10)
                                .background {
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke()
                                }
                        }
                        .foregroundColor(.accentColor)
                        .buttonStyle(.plain)
                        
                        Button {
                            self.viewModel.rejectAppointment(appointmentID: self.appointment.id)
                            self.mechanicAppointmentsViewModel.fetchAppointments()
                        } label: {
                            Text("Reddet")
                                .font(.footnote)
                                .padding(.horizontal, 10)
                                .background {
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke()
                                }
                        }
                        .foregroundColor(.red)
                        .buttonStyle(.plain)
                    }
                    .padding(.bottom, 10)
                }
                
                Text(self.appointment.date.dateValue().formatted(Date.FormatStyle().day(.twoDigits).month(.twoDigits).year()).description)
                    .bold()
                
                Text(self.appointment.date.dateValue().formatted(Date.FormatStyle().hour(.twoDigits(amPM: .omitted)).minute(.twoDigits)).description)
                    .font(.footnote)
            }
        }
    }
}

//struct MechanicAppointmentCell_Previews: PreviewProvider {
//    static var previews: some View {
//        MechanicAppointmentCell()
//    }
//}
