//
//  MainScreenViewModel.swift
//  ShoppingList
//
//  Created by Maksim Kasyanenko on 26.08.2023.
//

import Foundation

protocol MainScreenViewModelProtocol: ObservableObject, Identifiable {
    var shoppingLists: [ShoppingLists] { get set }
    func loadList()
    func updateName(id: UUID, newName: String)
    
}

class MainScreenViewModel: MainScreenViewModelProtocol {
    @Published var shoppingLists: [ShoppingLists] = []
    @Published  var iSshowAlert = false
    @Published  var textField1 = ""
    @Published  var textField2 = ""
    
    var storage: CoreDataService
    init(storage: CoreDataService ){
        self.storage = storage
        shoppingLists = storage.loadShoppingList()
       
    }
    
    convenience init(shoppingLists: [ShoppingLists]) {
        self.init(storage: CoreDataService())
        self.shoppingLists = shoppingLists
        
    }
    

    
    func loadList() {
       shoppingLists = storage.loadShoppingList()
    }
    
    func updateName(id: UUID, newName: String) {
        storage.updateShoppingListName(id: id, name: newName)
        loadList()
    }
}
