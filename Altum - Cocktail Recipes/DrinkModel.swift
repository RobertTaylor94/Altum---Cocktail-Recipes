//
//  DrinkModel.swift
//  Altum - Cocktail Recipes
//
//  Created by Robert Taylor on 05/05/2021.
//

import Foundation
import RealmSwift

struct DrinkModel {
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

class DBDrink: Object, Identifiable {
    @objc dynamic var strDrink: String = ""
    @objc dynamic var strGlass: String = ""
    @objc dynamic var strInstructions: String = ""
    @objc dynamic var strDrinkThumb: String = ""
    @objc dynamic var strIngredient1: String = ""
    @objc dynamic var strIngredient2: String = ""
    @objc dynamic var strIngredient3: String = ""
    @objc dynamic var strIngredient4: String = ""
    @objc dynamic var strIngredient5: String = ""
    @objc dynamic var strMeasure1: String = ""
    @objc dynamic var strMeasure2: String = ""
    @objc dynamic var strMeasure3: String = ""
    @objc dynamic var strMeasure4: String = ""
    @objc dynamic var strMeasure5: String = ""
}
