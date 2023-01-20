//
//  ContentView.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 21.10.2022.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group{
            if self.viewModel.userSession == nil{
//                LoginView()
                MainTabView()
            } else {
                MainTabView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
