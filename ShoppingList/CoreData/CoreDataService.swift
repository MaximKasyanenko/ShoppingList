//
//  CoreDataService.swift
//  ShoppingList
//
//  Created by Maksim Kasyanenko on 27.08.2023.
//

import Foundation
import CoreData

class CoreDataService {
    let viewContext = PersistenceController.shared.container.viewContext
    
    init() {}
   
    
 
    func saveContext() {
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
       
    }
  
}
// MARK: -ShoppingList-
extension CoreDataService {
    func addShoppingList(name: String, message: String) {
        let newItem = ShoppingListsEntities(context: viewContext)
        newItem.id = UUID()
        newItem.date = Date()
        newItem.name = name
        newItem.message = message
        newItem.state = true
        saveContext()
    }
    
        func loadShoppingList() -> [ShoppingLists] {
            var shoppingLists: [ShoppingListsEntities] = []
            let fetchRequest: NSFetchRequest<ShoppingListsEntities> = ShoppingListsEntities.fetchRequest()

            do {
                shoppingLists = try viewContext.fetch(fetchRequest)
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
            
           var list = shoppingLists.map { ShoppingLists.map(list: $0)}
            list.sort {$0.date > $1.date}
             return list
            
        }
    func updateShoppingListName(id: UUID, name: String) {
        let fetchRequest: NSFetchRequest<ShoppingListsEntities> = ShoppingListsEntities.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", id as CVarArg)
        do {
            let list = try viewContext.fetch(fetchRequest).first
            list?.name = name
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        saveContext()
     
    }
    

}
// MARK: -Product-
extension CoreDataService {
    func loadProductList(id: UUID) -> [Product] {
        let fetchRequest: NSFetchRequest<ProductEntities> = ProductEntities.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "shoppingList.id == %@", id as CVarArg)
        var list: [Product] = []
           do {
               let products = try viewContext.fetch(fetchRequest)
                products.forEach { product in
                   list.append(Product.map(product: product))
               }
              // let products = try viewContext.fetch(fetchRequest).first
               return list
           } catch {
               let nsError = error as NSError
               fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
           }
    }
    func addProduct(id: UUID) {
        var shoppingLists: ShoppingListsEntities
        let fetchRequest: NSFetchRequest<ShoppingListsEntities> = ShoppingListsEntities.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", id as CVarArg)

        do {
            shoppingLists = try viewContext.fetch(fetchRequest).first!
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        
        let newItem = ProductEntities(context: viewContext)
        newItem.id = UUID()
        newItem.name = "apple"
       // newItem.count = 1
        newItem.shoppingList = shoppingLists
        
       saveContext()
    }
}
