//
//  ShoppingListCell.swift
//  ShoppingList
//
//  Created by Maksim Kasyanenko on 26.08.2023.
//

import SwiftUI

struct ShoppingListCell: View {
    @Binding var shoppingList: ShoppingLists
    @State var newName: String = ""
    @State var isShowEdit: Bool = false
    @FocusState private var isTextFieldFocused: Bool
    var upDateClosure: (UUID, String) -> ()
    
    var body: some View {
        VStack(alignment: .leading){
            
            HStack(alignment: .top){
                if !isShowEdit {
                    Text(shoppingList.name)
                        .font(.title)
                        .padding(5)
                    
                    Spacer(minLength: 15)
                    Button {
                        newName = shoppingList.name
                        isShowEdit.toggle()
                    } label: {
                        Image(systemName: "ellipsis")
                            .frame(width: 10, height: 10)
                    }
                    .buttonStyle(.borderless)
                    .padding([.trailing, .top], 10)
                    .onTapGesture {
                        newName = shoppingList.name
                        isShowEdit.toggle()
                    }
                } else {
                    TextField(shoppingList.name, text: $newName)
                        .font(.title)
                        .padding( 2)
                        .focused($isTextFieldFocused)
                        .onSubmit {
                            upDateClosure(shoppingList.id, newName)
                            isShowEdit.toggle()
                        }
                        .onAppear{
                            isTextFieldFocused = true
                        }
                    
                    Button {
                        isShowEdit.toggle()
                    } label: {
                        Text("Cancel")
                    }.onTapGesture {
                        isShowEdit.toggle()
                    }
                    .buttonStyle(.automatic)
                    .padding([.top, .trailing], 10)
                    
                }
            }
            
            HStack {
                Text(shoppingList.message ?? "")
                    .lineLimit(2)
                    .font(.title2)
                    .foregroundColor(.black)
                    .padding(5)
                Spacer(minLength: 15)
                Text(shoppingList.date.string())
                    .padding(5)
                    .font(.caption)
            }
            
        }.background(content: {
            withAnimation {
                isShowEdit ? Color.white : Color.indigo
            }
            
        })
        .cornerRadius(10)
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray.opacity(0.3), lineWidth: 1))
        .shadow(color: .gray, radius: 5)
        
        
    }
}

struct ShoppingListCell_Previews: PreviewProvider {
    static var previews: some View {
        @State var shoppingList = ShoppingLists(name: "Product", message: "fdsjhfsfsddf", lists: [Product(name: "apple")], date: Date(), state: .active)
        ShoppingListCell(shoppingList: $shoppingList, upDateClosure: {id, name in
            
        })
        //  EmptyView()
    }
}
