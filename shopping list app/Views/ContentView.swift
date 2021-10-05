//
//  ContentView.swift
//  shopping list app
//
//  Created by Umut Gunebakan on 2021-10-04.
//

import SwiftUI

struct ContentView: View {
    
    @State var books = [ShoppingList]()
    @State var huhu:String
    
    
    var body: some View {
        NavigationView {
            VStack {
                List(books, id: \.id) { book in
                    NavigationLink(destination: itemsView()){
                        shoppingListItem(listItem: book)
                        Text("\(huhu)")
                    }
                }
                .ignoresSafeArea()
                .onAppear() {
                    Api().loadData { (books) in
                        self.books = books
                    }
                    huhu = Api().getOneData("2755c5cc-b7b3-453c-bb7f-3d7c956cb16c")
                }
            }.ignoresSafeArea()
            .navigationBarTitle(Text("Lists"), displayMode: .automatic)
            .navigationBarItems(trailing: NavigationLink(destination: itemsView()){
                Image(systemName: "plus")
                    .resizable()
                    .padding(6)
                    .frame(width: 24, height: 24)
                    .background(Color.blue)
                    .clipShape(Circle())
                    .foregroundColor(.white)
            })
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



