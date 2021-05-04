//
//  HomeView.swift
//  Altum - Cocktail Recipes
//
//  Created by Robert Taylor on 04/05/2021.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
//        ZStack {
//            Image("background").resizable().ignoresSafeArea().aspectRatio(contentMode: .fill)
            
        VStack {
                Spacer()
                VStack {
                    Text("My Drinks")
                    ScrollView(.horizontal) {
                        HStack {
                            SavedCocktailView()
                            SavedCocktailView()
                            SavedCocktailView()
                            SavedCocktailView()
                            SavedCocktailView()
                            SavedCocktailView()
                        }
                    }
                }
                .padding()
                .background(Color.black)
                .foregroundColor(.white)
                .cornerRadius(20)
                
                Spacer()
                
                HStack {
                    RandomDrinkView()
                }
                .padding()
                .background(Color.black)
                .foregroundColor(.white)
                .cornerRadius(20)
                
                Spacer()
                Spacer()
                Spacer()
            }
            .padding()
            .background(Image("background").resizable().ignoresSafeArea().aspectRatio(contentMode: .fill))
        }
   
    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
