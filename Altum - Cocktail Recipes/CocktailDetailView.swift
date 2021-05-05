//
//  CocktailDetailView.swift
//  Altum - Cocktail Recipes
//
//  Created by Robert Taylor on 04/05/2021.
//

import SwiftUI

struct CocktailDetailView: View {
    
    @State var strDrink: String = ""
    @State var strGlass: String = ""
    @State var strInstructions: String = ""
    @State var strDrinkThumb: String = ""
    @State var strIngredient1: String = ""
    @State var strIngredient2: String = ""
    @State var strIngredient3: String = ""
    @State var strIngredient4: String = ""
    @State var strIngredient5: String = ""
    @State var strMeasure1: String = ""
    @State var strMeasure2: String = ""
    @State var strMeasure3: String = ""
    @State var strMeasure4: String = ""
    @State var strMeasure5: String = ""
    
    
    var body: some View {
        
        Text(strDrink)
        
        
    }
}

struct CocktailDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CocktailDetailView()
    }
}
