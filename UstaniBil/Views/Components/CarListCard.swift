//
//  CarListCard.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 13.06.2023.
//

import SwiftUI
import Kingfisher

struct CarListCard: View{
    
    let car: Car
    @ObservedObject var profileViewModel: ProfileViewModel
    
    var body: some View{
        HStack(alignment: .top){
            KFImage(URL(string: self.car.logo))
                .resizable()
                .clipShape(Circle())
                .frame(width: 40, height: 40)
            
            VStack(alignment: .leading){
                Text("\(self.car.model)")
                    .font(.subheadline)
                    .bold()
            }
            
            Spacer()
            
            Button {
                self.profileViewModel.userService.removeCar(id: self.car.id)
            } label: {
                Text("Kaldır")
                    .foregroundColor(.white)
                    .font(.footnote)
                    .padding(6)
                    .background {
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.red)
                    }
            }
            .buttonStyle(.plain)
        }
    }
}
