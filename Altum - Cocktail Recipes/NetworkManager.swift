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
                        let drinkGlass = i.strGlass
                        let instructions = i.strInstructions
                        let thumbnail = i.strDrinkThumb
                        let ing1 = i.strIngredient1
                        let ing2 = i.strIngredient2
                        let ing3 = i.strIngredient3
                        let ing4 = i.strIngredient4
                        let ing5 = i.strIngredient5
                        let measure1 = i.strMeasure1
                        let mesaure2 = i.strMeasure2
                        let measure3 = i.strMeasure3
                        let measure4 = i.strMeasure4
                        let measure5 = i.strMeasure5
                        
                        DispatchQueue.main.async {
                            self.drinks.append(Items(strDrink: drinkTitle, strGlass: drinkGlass, strInstructions: instructions, strDrinkThumb: thumbnail, strIngredient1: ing1, strIngredient2: ing2, strIngredient3: ing3, strIngredient4: ing4, strIngredient5: ing5, strMeasure1: measure1, strMeasure2: mesaure2, strMeasure3: measure3, strMeasure4: measure4, strMeasure5: measure5))
                        }
                    }
                    
                    
                } catch {
                    print(error)
                }
            }
        }.resume()
        
    }
    
}


public class RandomDrinkManager: ObservableObject {
    
    @Published var randomDrink = [Items]()
    
    init() {
        getRandomDrink()
    }
    
    
    func getRandomDrink() {
        
        randomDrink.removeAll(keepingCapacity: false)
        
        let url = "https://www.thecocktaildb.com/api/json/v1/1/random.php"
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
                        let drinkGlass = i.strGlass
                        let instructions = i.strInstructions
                        let thumbnail = i.strDrinkThumb
                        let ing1 = i.strIngredient1
                        let ing2 = i.strIngredient2
                        let ing3 = i.strIngredient3
                        let ing4 = i.strIngredient4
                        let ing5 = i.strIngredient5
                        let measure1 = i.strMeasure1
                        let mesaure2 = i.strMeasure2
                        let measure3 = i.strMeasure3
                        let measure4 = i.strMeasure4
                        let measure5 = i.strMeasure5
                        
                        DispatchQueue.main.async {
                            self.randomDrink.append(Items(strDrink: drinkTitle, strGlass: drinkGlass, strInstructions: instructions, strDrinkThumb: thumbnail, strIngredient1: ing1, strIngredient2: ing2, strIngredient3: ing3, strIngredient4: ing4, strIngredient5: ing5, strMeasure1: measure1, strMeasure2: mesaure2, strMeasure3: measure3, strMeasure4: measure4, strMeasure5: measure5))
                        }
                    }
                    
                    
                } catch {
                    print(error)
                }
            }
        }.resume()
        
    }
}
    


struct Drink: Identifiable, Decodable {
    let id = UUID()
    let drinks: [Items]
}

struct Items: Identifiable, Decodable {
    let id = UUID()
    let strDrink: String
    let strGlass: String
    let strInstructions: String
    let strDrinkThumb: String
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strMeasure1: String?
    let strMeasure2: String?
    let strMeasure3: String?
    let strMeasure4: String?
    let strMeasure5: String?
}
