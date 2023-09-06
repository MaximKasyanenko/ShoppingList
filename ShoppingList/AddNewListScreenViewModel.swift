//
//  AddNewListScreenViewModel.swift
//  ShoppingList
//
//  Created by Maksim Kasyanenko on 04.09.2023.
//

import Foundation


class AddNewListScreenViewModel: ObservableObject {
    @Published  var textFieldName = ""
    @Published  var textFieldMessage = ""
    
    
    let storage: CoreDataService
    init(storage: CoreDataService) {
        self.storage = storage
    }
    
    func tapOk() {
        storage.addShoppingList(name: textFieldName, message: textFieldMessage)
    }
}
