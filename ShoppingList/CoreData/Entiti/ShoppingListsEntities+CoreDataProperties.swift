//
//  ShoppingListsEntities+CoreDataProperties.swift
//  ShoppingList
//
//  Created by Maksim Kasyanenko on 30.08.2023.
//
//

import Foundation
import CoreData


extension ShoppingListsEntities {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ShoppingListsEntities> {
        return NSFetchRequest<ShoppingListsEntities>(entityName: "ShoppingListsEntities")
    }

    @NSManaged public var date: Date
    @NSManaged public var id: UUID
    @NSManaged public var message: String?
    @NSManaged public var name: String
    @NSManaged public var state: Bool
    @NSManaged public var productList: NSSet?

}

// MARK: Generated accessors for productList
extension ShoppingListsEntities {

    @objc(addProductListObject:)
    @NSManaged public func addToProductList(_ value: ProductEntities)

    @objc(removeProductListObject:)
    @NSManaged public func removeFromProductList(_ value: ProductEntities)

    @objc(addProductList:)
    @NSManaged public func addToProductList(_ values: NSSet)

    @objc(removeProductList:)
    @NSManaged public func removeFromProductList(_ values: NSSet)

}

extension ShoppingListsEntities : Identifiable {

}
