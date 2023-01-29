//
//  AppoinmentsView.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 26.12.2022.
//

import SwiftUI

struct AppoinmentsView: View {
    
    @StateObject var viewModel = AppoinmentsViewModel()
    
    var body: some View {
        Form{
            Section {
                if let appo = self.viewModel.appoinments.first{
                    AppoinmentCell(appoinment: appo)
                }
            } header: {
                Text("Yaklaşan Randevularınız")
            }
            
            Section {
                
                HStack(alignment: .top){
                    
                    VStack(alignment: .leading){
                        
                        Text("Onay Bekliyor")
                            .foregroundColor(.accentColor)
                            .padding(.horizontal, 10)
                            .background {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(.gray)
                            }
                            .padding(.bottom, 10)
                        
                        Text("Motor Tamiri")
                            .bold()
                        
                        Text("Mehmet Özdemir")
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
                        
                        Text("15/03")
                            .bold()
                        
                        Text("09:00")
                            .font(.footnote)
                    }
                }
            }
            
            Section {
                
                HStack(alignment: .top){
                    
                    VStack(alignment: .leading){
                        
                        Text("Tamamlandı")
                            .foregroundColor(.accentColor)
                            .padding(.horizontal, 10)
                            .background {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(.gray)
                            }
                            .padding(.bottom, 10)
                        
                        Text("Polen Filtresi Değişimi")
                            .bold()
                        
                        Text("Turan Kaya")
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
                        
                        Text("12/01")
                            .bold()
                        
                        Text("10:00")
                            .font(.footnote)
                    }
                }
                
            } header: {
                Text("Geçmiş Randevularınız")
            }
            
        }
        .onAppear {
            self.viewModel.fetchAppoinments()
        }
    }
}

struct AppoinmentsView_Previews: PreviewProvider {
    static var previews: some View {
        AppoinmentsView()
    }
}


struct AppoinmentCell: View{
    let appoinment: Appoinment
    var body: some View{
        HStack(alignment: .top){
            
            VStack(alignment: .leading){
                
                Text(self.appoinment.status)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal, 10)
                    .background {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.gray)
                    }
                    .padding(.bottom, 10)
                
                Text(self.appoinment.description)
                    .bold()
                
                Text(self.appoinment.userID)
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
                
                Text(self.appoinment.date.dateValue().description)
                    .bold()
                
//                Text("15:00")
//                    .font(.footnote)
            }
        }
    }
}
