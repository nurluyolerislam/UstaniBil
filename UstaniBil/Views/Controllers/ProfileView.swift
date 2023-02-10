//
//  ProfileView.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 26.10.2022.
//

import SwiftUI
import Kingfisher

struct ProfileView: View {
    
    @EnvironmentObject var authViewModel: AuthViewModel
    @State var notificationStatus: Bool = true
    var body: some View {
        Form{
            Section {
                HStack{
                    KFImage(URL(string: self.authViewModel.currentUser?.profileImageLocation ?? ""))
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 56, height: 56)
                    
                    VStack(alignment: .leading){
                        Text(self.authViewModel.currentUser?.fullname ?? "")
                            .bold()
                        
                        Group{
                            Text(self.authViewModel.currentUser?.email ?? "")
                                .lineLimit(1)
                            Text(self.authViewModel.currentUser?.phone ?? "")
                            Text(self.authViewModel.currentUser?.address ?? "")
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
                    Image(systemName: "car")
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 40, height: 40)
                    
                    VStack(alignment: .leading){
                        Text("\(self.authViewModel.currentUser?.cars.first?.brand ?? "") \(self.authViewModel.currentUser?.cars.first?.model ?? "")")
                            .bold()
                        
                        Text(self.authViewModel.currentUser?.cars.first?.year ?? "")
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
                    self.authViewModel.signOut()
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
