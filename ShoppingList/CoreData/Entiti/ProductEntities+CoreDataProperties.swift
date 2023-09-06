//
//  ProductEntities+CoreDataProperties.swift
//  ShoppingList
//
//  Created by Maksim Kasyanenko on 30.08.2023.
//
//

import Foundation
import CoreData


extension ProductEntities {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProductEntities> {
        return NSFetchRequest<ProductEntities>(entityName: "ProductEntities")
    }

    @NSManaged public var count: Int64
    @NSManaged public var id: UUID
    @NSManaged public var imageUrl: String?
    @NSManaged public var message: String?
    @NSManaged public var name: String
    @NSManaged public var shoppingList: ShoppingListsEntities?

}

extension ProductEntities : Identifiable {

}
