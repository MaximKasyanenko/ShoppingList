//
//  Product.swift
//  ShoppingList
//
//  Created by Maksim Kasyanenko on 26.08.2023.
//

import Foundation

struct Product: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var message: String?
    var count: Int?
    var imageUrl: String?
    var list: ShoppingListsEntities?
    
    static func map(product: ProductEntities) -> Product {
        self.init(id: product.id,
                  name: product.name,
                  message: product.message,
                  count: Int(product.count),
                  imageUrl: product.imageUrl,
                  list: product.shoppingList
        )
    }
}
