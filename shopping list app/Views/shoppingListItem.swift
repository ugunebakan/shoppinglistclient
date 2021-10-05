//
//  shoppingListItem.swift
//  shopping list app
//
//  Created by Umut Gunebakan on 2021-10-05.
//

import SwiftUI

struct shoppingListItem: View {
    
    var listItem: ShoppingList
    
    var body: some View {
        HStack{
            Text(listItem.name)
            Spacer()
        }
        .padding()
    }
}

struct shoppingListItem_Previews: PreviewProvider {
    
    static var previews: some View {
        shoppingListItem(listItem: ShoppingList.init(id: UUID(uuidString: "d4e6df06-e831-41d7-8e0f-ea87a50a97aa")!, name: "adem"))
    }
}
