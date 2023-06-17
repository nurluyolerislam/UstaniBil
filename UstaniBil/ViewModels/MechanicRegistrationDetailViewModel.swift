//
//  MechanicRegistrationDetailViewModel.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 15.06.2023.
//

import Foundation


class MechanicRegistrationDetailViewModel: ObservableObject{
    @Published var brands: [Brand] = []
    @Published var selectedBrandID: Int = 0{
        willSet { self.selectedBrandName = self.brands.filter{$0.id == newValue}.first?.name ?? ""}
    }
    @Published var selectedBrandName: String = ""
    
    func fetchBrands(){
        guard let path = Bundle.main.path(forResource: "brands", ofType: "json") else {
            print("Brands dosyası bulunamadı.")
            return
        }
        
        do{
            let decoder = JSONDecoder()
            let data = try Data(contentsOf: URL(filePath: path))
            let model = try decoder.decode([Brand].self, from: data)
            self.brands = model
        } catch {
            print(error.localizedDescription)
        }
        
    }
}
