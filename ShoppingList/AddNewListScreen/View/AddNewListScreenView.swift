//
//  AddNewListScreenView.swift
//  ShoppingList
//
//  Created by Maksim Kasyanenko on 04.09.2023.
//

import SwiftUI

struct AddNewListScreenView: View {
    @StateObject var model: AddNewListScreenViewModel
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        VStack{
            TextField("Value 1", text: $model.textFieldName)
                .padding(15)
            TextField("Value 2", text: $model.textFieldMessage)
                .padding(15)
                .cornerRadius(15)
                .border(Color.red, width: 2)
                
                
                
            Spacer()
            HStack {
                Button("OK") {
                    model.tapOk()
                    dismiss()
                }
                    .padding(15)
                Spacer()
                Button("cancel") {
                    dismiss()
                }.padding(15)
            }
            
        }.presentationDetents([.medium, .large])
        .background{Color.white}
    }
}

struct AddNewListScreenView_Previews: PreviewProvider {
    static var previews: some View {
        @State var nameTextFielValue: String = ""
        @State var massageTextFielValue: String = ""
        let model = AddNewListScreenViewModel(storage: CoreDataService())
        AddNewListScreenView( model: model)
    }
}
