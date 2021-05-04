//
//  SavedCocktailView.swift
//  Altum - Cocktail Recipes
//
//  Created by Robert Taylor on 04/05/2021.
//

import SwiftUI

struct SavedCocktailView: View {
    var body: some View {
//        NavigationView {
            VStack(spacing: 10) {
                Text("Margherita")
                Image(systemName: "hourglass").resizable().frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                Text("Tequila")
                NavigationLink(
                    destination: CocktailDetailView(),
                    label: {
                        Image(systemName: "info.circle").foregroundColor(.black)
                    })
            }
            .padding()
            .background(Color.purple)
            .cornerRadius(20)
        }
    }
//}

struct SavedCocktailView_Previews: PreviewProvider {
    static var previews: some View {
        SavedCocktailView()
    }
}
