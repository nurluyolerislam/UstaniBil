//
//  StartupScreen.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 28.01.2023.
//

import SwiftUI

struct StartupScreen: View {
    var body: some View {
        VStack(spacing: 50){
            Image(systemName: "wrench.adjustable")
                .font(.system(size: 100))
                .foregroundColor(.accentColor)
            
            Text("Ustanı Bil, araçlarınızın bakım ve onarımı için size en uygun ustayı bulmanıza yardımcı olur.")
                .multilineTextAlignment(.center)
                .foregroundColor(.accentColor)
                .font(.title2)
            
            NavigationLink {
                LoginView()
            } label: {
                Spacer()
                Text("Devam Et")
                    .bold()
                Spacer()
            }
            .padding(.vertical, 10)
            .foregroundColor(.white)
            .background {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundColor(.accentColor)
            }
            
        }
        .padding()
    }
}

struct StartupScreen_Previews: PreviewProvider {
    static var previews: some View {
        StartupScreen()
    }
}
