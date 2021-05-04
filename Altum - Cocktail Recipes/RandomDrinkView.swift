//
//  DrinkOfTheDayView.swift
//  Altum - Cocktail Recipes
//
//  Created by Robert Taylor on 04/05/2021.
//

import SwiftUI

struct RandomDrinkView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Title")
            Text("Ingredients")
            Spacer()
            HStack {
                
                Image(systemName: "hourglass").resizable()
                
                VStack {
                    Text("How To do this drink with instructions.")
                }
                
            }
        }.padding().frame(width: 300, height: 300).background(Color.red).cornerRadius(20)
        
    }
}

struct DrinkOfTheDayView_Previews: PreviewProvider {
    static var previews: some View {
        RandomDrinkView()
    }
}
