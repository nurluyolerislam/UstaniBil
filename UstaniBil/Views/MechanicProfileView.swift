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

struct MechanicProfileView_Previews: PreviewProvider {
    static var previews: some View {
        MechanicProfileView()
    }
}
