//
//  AppoinmentCell.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 29.01.2023.
//

import SwiftUI

struct AppoinmentCell: View{
    let appoinment: Appoinment
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
                    
                Text(self.appoinment.description)
                    .bold()
                
                Text(self.appoinment.mechanicID)
                    .font(.footnote)
            }
            
            Spacer()
            
            VStack{
                
                Button {
                    
                } label: {
                    Text("Detay")
                        .padding(.horizontal, 10)
                        .background {
                            RoundedRectangle(cornerRadius: 20)
                                .stroke()
                        }
                }
                .foregroundColor(.accentColor)
                .buttonStyle(.plain)
                .padding(.bottom, 10)
                
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
