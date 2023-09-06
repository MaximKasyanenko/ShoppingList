//
//  ShoppingListApp.swift
//  ShoppingList
//
//  Created by Maksim Kasyanenko on 22.08.2023.
//

import SwiftUI

@main
struct ShoppingListApp: App {
//    let storage = CoreDataService()
//    let fakeModel = MainScreenViewModel(storage: storage)
    var body: some Scene {
        WindowGroup {
            let storage = CoreDataService()
            let fakeModel = MainScreenViewModel(storage: storage)
            MainScreenView(model: fakeModel)
          //  TestScreenView(model: fakeModel)
        }
    }
}
