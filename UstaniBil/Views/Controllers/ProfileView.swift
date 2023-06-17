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
    @StateObject var viewModel = ProfileViewModel()
    @State var addCarSheetIsOpen: Bool = false
    @State var isEditProfileOpen: Bool = false
    
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
                        self.isEditProfileOpen = true
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
                
                ForEach(self.viewModel.userCars, id: \.id) { car in
                    CarListCard(car: car, profileViewModel: self.viewModel)
                }
                
                HStack{
                    Spacer()
                    Button {
                        self.addCarSheetIsOpen = true
                    } label: {
                        Text("Araba Ekle")
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
                Text("Arabaların")
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
        .sheet(isPresented: self.$addCarSheetIsOpen) {
            AddCarSheet(profileViewModel: self.viewModel)
        }
        .sheet(isPresented: self.$isEditProfileOpen) {
            EditProfileSheet(profileViewModel: self.viewModel)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
