//
//  UstaniBilApp.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 21.10.2022.
//

import SwiftUI
import Firebase

@main
struct UstaniBilApp: App {
    
    @StateObject var viewModel = AuthViewModel()
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ContentView()
            }
            .environmentObject(self.viewModel)
        }
    }
}
