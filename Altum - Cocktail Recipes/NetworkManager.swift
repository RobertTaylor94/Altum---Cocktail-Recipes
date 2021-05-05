//
//  NetworkManager.swift
//  Altum - Cocktail Recipes
//
//  Created by Robert Taylor on 05/05/2021.
//

import Foundation

public class NetworkManager: ObservableObject {
    
    @Published var drinks = [Items]()
    
    init(search: String) {
        getJsonData(string: search)
    }
    
    func getJsonData(string: String) {
        drinks.removeAll(keepingCapacity: false)
        let url = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=\(string)"
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: URL(string: url)!) { data, _, error in
            if error != nil {
                print(error!)
                return
            }
            if let safeData = data {
                let decoder = JSONDecoder()
                
                do {
                    let decodedData = try decoder.decode(Drink.self, from: safeData)
                    
                    for i in decodedData.drinks {
                        let drinkTitle = i.strDrink
                        
                        DispatchQueue.main.async {
                            self.drinks.append(Items(strDrink: drinkTitle))
                        }
                    }
                    
                    
                } catch {
                    print(error)
                }
            }
        }.resume()
        
    }
}
    
//    func parseJSON(_ drinkData: Data) -> DrinkModel? {
//        let decoder = JSONDecoder()
//        do {
//            let decodedData = try decoder.decode(Drink.self, from: drinkData)
//            let drinkName = decodedData.drinks[0].strDrink
//
//            let drink = DrinkModel(strDrink: drinkName)
//            return drink
//        } catch {
//            print("did fail with error\(error)")
//            return nil
//        }
//    }
//
//}

struct Drink: Identifiable, Decodable {
    let id = UUID()
    let drinks: [Items]
}

struct Items: Identifiable, Decodable {
    let id = UUID()
    let strDrink: String
//    let strGlass: String
//    let strInstructions: String
//    let strDrinkThumb: String
//    let strIngredient1: String?
//    let strIngredient2: String?
//    let strIngredient3: String?
//    let strIngredient4: String?
//    let strIngredient5: String?
//    let strMeasure1: String?
//    let strMeasure2: String?
//    let strMeasure3: String?
//    let strMeasure4: String?
//    let strMeasure5: String?
}
