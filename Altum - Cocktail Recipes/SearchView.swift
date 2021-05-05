//
//  SearchView.swift
//  Altum - Cocktail Recipes
//
//  Created by Robert Taylor on 04/05/2021.
//

import SwiftUI

struct SearchView: View {
    
    @ObservedObject var networkManager = NetworkManager(search: "")
    
    var body: some View {
        List(networkManager.drinks) { i in
            Text(i.strDrink)
        }.onAppear(){
            self.networkManager.getJsonData(string: "margarita")
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

