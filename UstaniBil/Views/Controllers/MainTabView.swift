//
//  MainTabView.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 26.10.2022.
//

import SwiftUI

struct MainTabView: View {
    
    @State var selectedTabIndex = 0
    
    var body: some View {
        TabView(selection: self.$selectedTabIndex){
            
            HomeView()
                .tabItem {
                    Label {
                        Text("Ana Sayfa")
                    } icon: {
                        Image(systemName: "house")
                    }
                }
                .tag(0)
            
            AppoinmentsView()
                .tabItem {
                    Label {
                        Text("Randevular")
                    } icon: {
                        Image(systemName: "bookmark")
                    }
                }
                .tag(1)
            
            NotificationsView()
                .tabItem {
                    Label {
                        Text("Bildirimler")
                    } icon: {
                        Image(systemName: "bell")
                    }
                }
                .tag(2)
                .badge(3)
            
            ProfileView()
                .tabItem {
                    Label {
                        Text("Profil")
                    } icon: {
                        Image(systemName: "person")
                    }
                }
                .tag(3)
        }
        .accentColor(.green)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
