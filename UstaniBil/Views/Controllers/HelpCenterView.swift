//
//  HelpCenterView.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 7.01.2023.
//

import SwiftUI

struct HelpCenterView: View {
    var body: some View {
        VStack{
            Spacer()
            Text("Bu uygulama;\nKahramanmaraş Sütçü İmam Üniversitesi \nMimarlık ve Mühendislik Fakültesi\nBilgisayar Mühendisliği bölümü öğrencisi olan\n20110131071 öğrenci numaralı Erislam NURLUYOL'un 2022-2023 eğitim yılı bitirme projesidir.")
            Spacer()
            Text("\nUygulamanın fikri mülkiyeti Dr.Öğr.Üyesi Yavuz CANBAY'a aittir.")
                .font(.footnote)
        }
        .padding()
    }
}

struct HelpCenterView_Previews: PreviewProvider {
    static var previews: some View {
        HelpCenterView()
    }
}
