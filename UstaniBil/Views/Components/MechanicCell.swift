//
//  MechanicCell.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 2.12.2022.
//

import SwiftUI
import Kingfisher

struct MechanicCell: View {
    
    let mechanic: Mechanic
    
    var body: some View {
        VStack{
            HStack{
                KFImage(URL(string: self.mechanic.profileImageLocation))
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 56, height: 56)
                
                VStack(alignment: .leading){
                    Text(self.mechanic.fullname)
                        .bold()
                    HStack(spacing: 1){
                        Image(systemName: self.mechanic.avarageScore < 1  ? "wrench.adjustable" : "wrench.adjustable.fill")
                        Image(systemName: self.mechanic.avarageScore < 2  ? "wrench.adjustable" : "wrench.adjustable.fill")
                        Image(systemName: self.mechanic.avarageScore < 3  ? "wrench.adjustable" : "wrench.adjustable.fill")
                        Image(systemName: self.mechanic.avarageScore < 4  ? "wrench.adjustable" : "wrench.adjustable.fill")
                        Image(systemName: self.mechanic.avarageScore < 5  ? "wrench.adjustable" : "wrench.adjustable.fill")
                        Text(" | \(self.mechanic.totalVotes) Değerlendirme")
                            .foregroundColor(.black)
                    }
                    .font(.system(size: 10))
                    .foregroundColor(.accentColor)
                }
                
                Spacer()
            }
            
            HStack(spacing: 5){
                Image(systemName: "mappin.and.ellipse")
                Text(self.mechanic.address)
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
        MechanicCell(mechanic: Mechanic(about: "Marka araçları üzerinde 10 yıllık deneyime sahibim. 4 yıldır elektromekanik alanında çalışıyorum.",
                                        address: "Kahramanmaraş",
                                        avarageScore: 4.5,
                                        brand: "Ford",
                                        company: "Kemak A.Ş.",
                                        education: "Lise",
                                        email: "mehmetozdemir@gmail.com",
                                        fullname: "Mehmet Özdemir",
                                        id: "4guQBJMzd0qevDUPCLSP",
                                        languages: ["Türkçe"],
                                        phone: "+905444444444",
                                        profileImageLocation: "gs://ustanibil-3a48d.appspot.com/erislam.jpg",
                                        totalVotes: 1287))
    }
}
