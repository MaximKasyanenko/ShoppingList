//
//  TestView.swift
//  ShoppingList
//
//  Created by Maksim Kasyanenko on 28.08.2023.
//

import Foundation
import SwiftUI
//struct TestScreenView: View {
//    @StateObject var model: MainScreenViewModel
//    
//    var body: some View {
//        NavigationStack{
//            List($model.list) {list in
//                ZStack{
//                    NavigationLink {
//                        DetailsScreanView(list: list)
//                    } label: {
//                        EmptyView()
//                    }.opacity(0)
//                    ShoppingListCell(shoppingList: list)
//                } .listRowBackground(Color.clear)
//            }.listStyle(.plain)
//            
//                .toolbar(content: {
//                    Button {
//                        model.storage.addShoppingList()
//                        model.updateList()
//                    } label: {
//                        Text("add")
//                    }
//                    
//                })
//                .navigationTitle("Shopping list")
//                .background {
//                    Color.cyan
//                        .ignoresSafeArea(edges: [.bottom])
//                }
//                .onDisappear {
//                    model.storage.saveContext()
//                }
//            
//            
//        }
//    }
//}
//
//
//
//struct TestView_Previews: PreviewProvider {
//    
//    
//    static var previews: some View {
//        //            let fakeModel = MainScreenViewModel(shoppingLists: [ShoppingLists(name: "Product", message: "dwsfwefwsd", lists: [Product(name: "apple")], date: Date(), state: .active), ShoppingLists(name: "Product", message: "nnnbnnjgjkdjfkdgj", lists: [Product(name: "apple")], date: Date(), state: .active), ShoppingLists(name: "Product", message: "dsdsfgrefeeswef", lists: [Product(name: "apple")], date: Date(), state: .active), ShoppingLists(name: "Product", message: "dwsfwefwsd", lists: [Product(name: "apple")], date: Date(), state: .active), ShoppingLists(name: "Product", message: "nnnbnnjgjkdjfkdgj", lists: [Product(name: "apple")], date: Date(), state: .active), ShoppingLists(name: "Product", message: "dsdsfgrefeeswef", lists: [Product(name: "apple")], date: Date(), state: .active), ShoppingLists(name: "Product", message: "dwsfwefwsd", lists: [Product(name: "apple")], date: Date(), state: .active), ShoppingLists(name: "Product", message: "nnnbnnjgjkdjfkdgj", lists: [Product(name: "apple")], date: Date(), state: .active), ShoppingLists(name: "Product", message: "dsdsfgrefeeswef", lists: [Product(name: "apple")], date: Date(), state: .active)])
//        
//        TestScreenView(model: MainScreenViewModel(storage: CoreDataService()))
//    }
//}
