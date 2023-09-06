//
//  MainScreenView.swift
//  ShoppingList
//
//  Created by Maksim Kasyanenko on 22.08.2023.
//

import SwiftUI



struct MainScreenView: View {
    @StateObject var model: MainScreenViewModel
    var body: some View {
        NavigationStack{
            List($model.shoppingLists) {list in
                ZStack{
                    NavigationLink {
                        ScreenBuilder.shared.createDetailsScreen(list: list)
                    } label: {
                        EmptyView()
                    }.opacity(0)
                    ShoppingListCell(shoppingList: list) { id, name in
                        model.updateName(id: id, newName: name)}
                } .listRowBackground(Color.clear)
            }.listStyle(.plain)
                .toolbar(content: {
                    Button {
                        model.iSshowAlert.toggle()
                    } label: {
                        Image(systemName: "plus.app")
                        
                    }
                    
                })
                .navigationTitle("Shopping list")
                .background {
                    Color.cyan
                        .ignoresSafeArea(edges: [.bottom])
                }

        }.sheet(isPresented: $model.iSshowAlert) {
            ScreenBuilder.shared.createAddNewSrean()
                .onDisappear(perform: model.loadList)
        }
        
    }
    
}



struct ContentView_Previews: PreviewProvider {
    
    
    static var previews: some View {
        
        
        MainScreenView(model: MainScreenViewModel(storage: CoreDataService()))
    }
}

