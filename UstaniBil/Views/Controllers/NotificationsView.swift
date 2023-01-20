//
//  NotificationsView.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 26.12.2022.
//

import SwiftUI

struct NotificationsView: View {
    
    @State var showingIndex = 0
    
    var body: some View {
        
        Form{
            
            Section{
                HStack(alignment: .top){
                    Image(systemName: "bell")
                        .foregroundColor(.accentColor)
                    VStack(alignment: .leading){
                        Text("Randevu Uyarısı")
                            .bold()
                        
                        Text("Emirhan Koçak ile olan randevunuz 15 dakika sonra başlayacak. Lütfen geç kalmayın!")
                            .font(.footnote)
                    }
                }
            }
            
            Section{
                HStack(alignment: .top){
                    Image(systemName: "hand.thumbsup")
                        .foregroundColor(.accentColor)
                    VStack(alignment: .leading){
                        Text("Randevunuz Onaylandı")
                            .bold()
                        
                        Text("Emihan Koçak ile olan randevun talebiniz onaylandı. Randevu tarihiniz 23 Ocak 2023 15:00.")
                            .font(.footnote)
                    }
                }
            }
            
            Section{
                HStack(alignment: .top){
                    Image(systemName: "hand.thumbsdown")
                        .foregroundColor(.accentColor)
                    VStack(alignment: .leading){
                        Text("Randevunuz Reddedildi")
                            .bold()
                        
                        Text("Doğan Can Bayazıt ile olan randevun talebiniz reddedildi.")
                            .font(.footnote)
                    }
                }
            }
            
        }
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}
