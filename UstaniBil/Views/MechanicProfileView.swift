//
//  MechanicProfileView.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 6.06.2023.
//

import SwiftUI
import Kingfisher

struct MechanicProfileView: View {
    
    @EnvironmentObject var authViewModel: AuthViewModel
    @State var isEditMechanicProfileOpen = false
    @StateObject var viewModel = MechanicProfileViewModel()
    @State var isAddServiceSheetOpen = false
    
    var body: some View {
        Form {
            Section {
                HStack{
                    KFImage(URL(string: ApplicationVariables.userProfileImageLocation))
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 56, height: 56)
                    
                    VStack(alignment: .leading){
                        Text(ApplicationVariables.userFullname)
                            .bold()
                        
                        Group{
                            Text(ApplicationVariables.userEmail)
                                .lineLimit(1)
                            Text(ApplicationVariables.userPhone)
                            Text(ApplicationVariables.userAddress)
                        }
                        .foregroundColor(.gray)
                        .font(.footnote)
                    }
                    
                    Spacer()
                    
                    Button {
                        self.isEditMechanicProfileOpen = true
                    } label: {
                        Text("Düzenle")
                            .foregroundColor(.white)
                            .font(.footnote)
                            .padding(6)
                            .background {
                                RoundedRectangle(cornerRadius: 20)
                                    .foregroundColor(.accentColor)
                            }
                    }
                    .buttonStyle(.plain)
                    
                }
            } header: {
                Text("Profil")
            }
            
            Section {
                
                ForEach(self.viewModel.mechanicServices, id: \.self) { service in
                    HStack{
                        Text(service.service)
                        Spacer()
                        Text("\(service.price) TL")
                    }
                    .font(.subheadline)
                    .bold()
                }
                
                HStack{
                    Spacer()
                    Button {
                        self.isAddServiceSheetOpen = true
                    } label: {
                        Text("Hizmet Ekle")
                            .foregroundColor(.white)
                            .font(.footnote)
                            .padding(6)
                            .background {
                                RoundedRectangle(cornerRadius: 20)
                                    .foregroundColor(.accentColor)
                            }
                    }
                    .buttonStyle(.plain)
                    Spacer()
                }
                
            } header: {
                Text("Hizmetlerin")
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
        .sheet(isPresented: self.$isEditMechanicProfileOpen) {
            EditMechanicProfileSheet(mechanicProfileViewModel: self.viewModel)
        }
        .sheet(isPresented: self.$isAddServiceSheetOpen) {
            AddServiceSheet(mechanicProfileViewModel: self.viewModel)
        }
    }
}

struct MechanicProfileView_Previews: PreviewProvider {
    static var previews: some View {
        MechanicProfileView()
    }
}
