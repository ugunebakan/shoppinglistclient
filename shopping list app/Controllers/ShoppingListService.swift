//
//  ShoppingListService.swift
//  shopping list app
//
//  Created by Umut Gunebakan on 2021-10-04.
//

import Foundation

class Api : ObservableObject{
    @Published var shoppingLists = [ShoppingList]()
    @Published var shoppingList = ShoppingList.self
    
    func loadData(completion:@escaping ([ShoppingList]) -> ()) {
        guard let url = URL(string: "http://192.168.0.119:8080/api/v1/shoppinglist/") else {
            print("Invalid url...")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            let shoppingLists = try! JSONDecoder().decode([ShoppingList].self, from: data!)
            print(shoppingLists)
            DispatchQueue.main.async {
                completion(shoppingLists)
            }
        }.resume()
        
    }
    
    func getOneData(_ id:String) -> String {
        guard let urlOne = URL(string: "http://192.168.0.119:8080/api/v1/shoppinglist/" + id) else {
            print("Invalid url...")
            return "0"
        }
        URLSession.shared.dataTask(with: urlOne) { data, response, error in
            let shoppingList = try! JSONDecoder().decode(ShoppingList.self, from: data!)
            print(shoppingList)
            DispatchQueue.main.async {
                return "1"
            }
        }.resume()
        
    }
}

struct ShoppingList: Decodable {
    let id: UUID
    let name: String
}
