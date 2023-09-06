//
//  ScreenBuilder.swift
//  ShoppingList
//
//  Created by Maksim Kasyanenko on 04.09.2023.
//

import Foundation
import SwiftUI

class ScreenBuilder {
   static let shared = ScreenBuilder()
    private init(){}
    
    private let storage = CoreDataService()
    
     func createMainscreen() -> MainScreenView {
        let model = MainScreenViewModel(storage: storage)
        let view = MainScreenView(model: model)
        return view
    }
     
    func createDetailsScreen(list: Binding<ShoppingLists>) -> DetailsScreanView {
        let model = DetailViewModel(storage: storage)
        let view = DetailsScreanView(model: model, list: list)
        return view
    }
    
    func createAddNewSrean() -> AddNewListScreenView {
        let model = AddNewListScreenViewModel(storage: storage)
        let view = AddNewListScreenView(model: model)
        return view
    }
}
