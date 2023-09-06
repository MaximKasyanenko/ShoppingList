//
//  DetailViewModel.swift
//  ShoppingList
//
//  Created by Maksim Kasyanenko on 28.08.2023.
//

import Foundation
class DetailViewModel: ObservableObject {
    @Published var product: [Product] = []
    let storage: CoreDataService
    
    init(storage: CoreDataService) {
        self.storage = storage
    }
    
    func addProduct(id: UUID) {
        storage.addProduct(id: id)
        loadProduct(id: id)
    }
     
    func loadProduct(id: UUID) {
        let list = storage.loadProductList(id: id)
        product = list
        
        
    }
  
}
