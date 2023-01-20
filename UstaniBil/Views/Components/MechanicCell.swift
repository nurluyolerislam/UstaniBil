//
//  MechanicCell.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 2.12.2022.
//

import SwiftUI

struct MechanicCell: View {
    
    let mechanic: Mechanic
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "person.circle.fill")
                    .font(.system(size: 56))
                
                VStack(alignment: .leading){
                    Text(self.mechanic.fullName)
                        .bold()
                    HStack(spacing: 1){
                        Image(systemName: self.mechanic.avarageScore < 1  ? "wrench.adjustable" : "wrench.adjustable.fill")
                        Image(systemName: self.mechanic.avarageScore < 2  ? "wrench.adjustable" : "wrench.adjustable.fill")
                        Image(systemName: self.mechanic.avarageScore < 3  ? "wrench.adjustable" : "wrench.adjustable.fill")
                        Image(systemName: self.mechanic.avarageScore < 4  ? "wrench.adjustable" : "wrench.adjustable.fill")
                        Image(systemName: self.mechanic.avarageScore < 5  ? "wrench.adjustable" : "wrench.adjustable.fill")
                        Text(" | \(self.mechanic.totalVote) Değerlendirme")
                            .foregroundColor(.black)
                    }
                    .font(.system(size: 10))
                    .foregroundColor(.accentColor)
                }
                
                Spacer()
            }
            
            HStack(spacing: 5){
                Image(systemName: "mappin.and.ellipse")
                Text(self.mechanic.city)
                Spacer()
            }
            .font(.footnote)
            .foregroundColor(.black)
            
            HStack(spacing: 5){
                Image(systemName: "trophy")
                Text("\(self.mechanic.brand) Uzmanı")
                Spacer()
            }
            .font(.footnote)
            .foregroundColor(.black)
        }
        .padding()
        .background{
            RoundedRectangle(cornerRadius: 20)
                .stroke()
        }
    }
}

struct MechanicCell_Previews: PreviewProvider {
    static var previews: some View {
        MechanicCell(mechanic: Mechanic(avarageScore: 4.3,
                                        brand: "Renault",
                                        city: "Kahramanmaraş",
                                        company: "Bayazıt A.Ş.",
                                        fullName: "Doğan Can Bayazıt",
                                        phone: "+905554443322",
                                        totalVote: 3158))
    }
}
