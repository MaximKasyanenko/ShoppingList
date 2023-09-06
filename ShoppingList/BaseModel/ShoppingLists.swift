//
//  ShoppingLists.swift
//  ShoppingList
//
//  Created by Maksim Kasyanenko on 26.08.2023.
//

import Foundation
enum ShoppingListsState {
    case active
    case notActive
}
struct ShoppingLists: Identifiable {
   
    
    
    var id = UUID()
    var name: String
    var message: String?
    var lists: [Product]
    var date: Date
    var state: ShoppingListsState
    
    static func map(list: ShoppingListsEntities) -> ShoppingLists {
        self.init(id: list.id,
                  name: list.name,
                  message: list.message,
                  lists: list.productList?.map({ Product.map(product: $0 as! ProductEntities)}) ?? [],
                  date: list.date,
                  state: list.state ? ShoppingListsState.active : ShoppingListsState.notActive )
    }
    
}


