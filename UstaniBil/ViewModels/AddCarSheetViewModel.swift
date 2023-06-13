//
//  AddCarSheetViewModel.swift
//  UstaniBil
//
//  Created by Erislam Nurluyol on 12.06.2023.
//

import Foundation
import Firebase

class AddCarSheetViewModel: ObservableObject{
    @Published var brands: [Brand] = []
    @Published var automobiles: [Automobile] = []
    @Published var selectedBrandID: Int = 3
    @Published var selectedAutomobileID: Int = 0
    let service = UserService()
    
//    func fetchBrands(){
//        Firestore.firestore().collection("brands")
//            .getDocuments { snapshot, error in
//                if let error = error{
//                    print("DEBUG: Failed to fetch brands with error \(error.localizedDescription)")
//                }
//                guard let documents = snapshot?.documents else {return}
//                let brands = documents.compactMap({try? $0.data(as: Brand.self)})
//                self.brands.removeAll()
//                self.brands = brands
//            }
//    }
    
    func fetchBrands(){
        guard let path = Bundle.main.path(forResource: "brands", ofType: "json") else {
            print("Brands dosyası bulunamadı.")
            return
        }
        
        do{
            let decoder = JSONDecoder()
            let data = try Data(contentsOf: URL(filePath: path))
            let model = try decoder.decode([Brand].self, from: data)
            self.automobiles.removeAll()
            self.brands = model
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
//    func fetchAutomobilesForBrand(brandID: Int){
//        Firestore.firestore().collection("automobiles").whereField("brand_id", isEqualTo: brandID)
//            .getDocuments { snapshot, error in
//                if let error = error{
//                    print("DEBUG: Failed to fetch automobiles for brand with error \(error.localizedDescription)")
//                }
//                guard let documents = snapshot?.documents else {return}
//                let automobiles = documents.compactMap({try? $0.data(as: Automobile.self)})
//                self.automobiles.removeAll()
//                self.automobiles = automobiles
//            }
//    }
    
    func fetchAutomobilesForBrand(){
        guard let path = Bundle.main.path(forResource: "automobiles", ofType: "json") else {
            print("Automobiles dosyası bulunamadı.")
            return
        }
        
        do{
            let decoder = JSONDecoder()
            let data = try Data(contentsOf: URL(filePath: path))
            let model = try decoder.decode([Automobile].self, from: data)
            self.automobiles.removeAll()
            self.automobiles.append(contentsOf: model.filter {$0.brandID == self.selectedBrandID})
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func addCar(){
        if let selectedCarModel = self.automobiles.filter{$0.id == self.selectedAutomobileID}.first{
            self.service.addCar(car: Car(brandID: selectedBrandID, logo: self.brands.filter{$0.id == selectedCarModel.brandID}.first?.logoURL ?? "", model: selectedCarModel.name))
        }
//        if let selectedCarModel = self.automobiles.filter{$0.id == self.selectedAutomobileID}.first?.name {
//            self.service.addCar(model: selectedCarModel)
//        }
    }
}
