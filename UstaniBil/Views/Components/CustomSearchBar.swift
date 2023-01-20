//
//  CustomSearchBar.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 26.12.2022.
//

import SwiftUI

struct CustomSearchBar: View {
    @Binding var text: String
    var body: some View {
        HStack{
            TextField("Ara", text: self.$text)
            
            Image(systemName: "magnifyingglass")
        }
        .padding(10)
        .background {
            RoundedRectangle(cornerRadius: 20)
                .stroke()
        }
    }
}

struct CustomSearchBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomSearchBar(text: .constant(""))
            .padding()
    }
}
