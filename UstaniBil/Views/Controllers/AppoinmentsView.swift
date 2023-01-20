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
                
                HStack(alignment: .top){
                    
                    VStack(alignment: .leading){
                        
                        Text("Onaylandı")
                            .foregroundColor(.accentColor)
                            .padding(.horizontal, 10)
                            .background {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(.gray)
                            }
                            .padding(.bottom, 10)
                        
                        Text("Fren Balata Değişimi")
                            .bold()
                        
                        Text("Emirhan Koçak")
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
                        
                        Text("23/01")
                            .bold()
                        
                        Text("15:00")
                            .font(.footnote)
                    }
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
                        
                        Text("Osman Bilginer")
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
                        
                        Text("Doğan Can Bayazıt")
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
//        .onAppear {
//            self.viewModel.fetchAppoinments()
//        }
    }
}

struct AppoinmentsView_Previews: PreviewProvider {
    static var previews: some View {
        AppoinmentsView()
    }
}
