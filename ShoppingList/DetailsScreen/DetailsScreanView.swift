//
//  DetailsScreanView.swift
//  ShoppingList
//
//  Created by Maksim Kasyanenko on 26.08.2023.
//

import SwiftUI

struct DetailsScreanView: View {
    @StateObject var model: DetailViewModel
    @Binding var list: ShoppingLists
    var body: some View {
        
        List($model.product) { product in
            Text(product.name.wrappedValue)
            
        } .toolbar(content: {
            Button {
                model.addProduct(id: list.id)
                
            } label: {
                Text("add")
            }
            .onAppear{
                model.loadProduct(id: list.id)
            }
        })
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        
       // DetailsScreanView(list: $list)
        EmptyView()
    }
}
