//
//  MechanicMainTabView.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 6.06.2023.
//

import SwiftUI

struct MechanicMainTabView: View {
    
    @State var selectedTabIndex = 0
    
    var body: some View {
        TabView(selection: self.$selectedTabIndex){
            
            MechanicAppointmentsView()
                .tabItem {
                    Label {
                        Text("Randevular")
                    } icon: {
                        Image(systemName: "bookmark")
                    }
                }
                .tag(0)
            
            MechanicProfileView()
                .tabItem {
                    Label {
                        Text("Profil")
                    } icon: {
                        Image(systemName: "person")
                    }
                }
                .tag(1)
        }
    }
}

struct MechanicMainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MechanicMainTabView()
    }
}
