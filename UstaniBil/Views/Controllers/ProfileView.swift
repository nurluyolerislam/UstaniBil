//
//  ProfileView.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 26.10.2022.
//

import SwiftUI

struct ProfileView: View {
    
    @State var notificationStatus: Bool = true
    var body: some View {
        Form{
            Section {
                HStack(alignment: .top){
                    Image("erislam")
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 56, height: 56)
                    
                    VStack(alignment: .leading){
                        Text("Erislam Nurluyol")
                            .bold()
                        
                        Group{
                            Text("nurluyolerislam@gmail.com")
                            Text("+90 536 913 24 83")
                            Text("Tekerek Mh. 94033. Sk Onikişubat/Kahramanmaraş")
                        }
                        .foregroundColor(.gray)
                        .font(.footnote)
                    }
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Text("Düzenle")
                            .foregroundColor(.white)
                            .font(.footnote)
                            .padding(6)
                            .background {
                                RoundedRectangle(cornerRadius: 20)
//                                    .fill(.green)
                                    .foregroundColor(.accentColor)
                            }
                    }
                    .buttonStyle(.plain)
                    
                }
            } header: {
                Text("Profil")
            }
            
            Section {
                HStack(alignment: .top){
                    Image("ford")
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 40, height: 40)
                    
                    VStack(alignment: .leading){
                        Text("Ford Focus")
                            .bold()
                        
                        Text("Sedan | 2020")
                            .font(.footnote)
                    }
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Text("Düzenle")
                            .foregroundColor(.white)
                            .font(.footnote)
                            .padding(6)
                            .background {
                                RoundedRectangle(cornerRadius: 20)
//                                    .fill(.green)
                                    .foregroundColor(.accentColor)
                            }
                    }
                    .buttonStyle(.plain)
                }
            } header: {
                Text("Arabaların")
            }
            
            Section {
                Toggle("Bildirimler", isOn: self.$notificationStatus)
            } header: {
                Text("Ayarlar")
            }
            
            Section{
                NavigationLink {
                    HelpCenterView()
                } label: {
                    Text("Yardım Merkezi")
                }
            }
            
            Section{
                Button {
                    
                } label: {
                    Text("Çıkış Yap")
                        .foregroundColor(.red)
                }

            }
            
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
