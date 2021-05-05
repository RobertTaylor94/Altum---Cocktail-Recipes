//
//  HomeView.swift
//  Altum - Cocktail Recipes
//
//  Created by Robert Taylor on 04/05/2021.
//

import SwiftUI

struct HomeView: View {
    var body: some View {

        NavigationView {
        VStack {
                Spacer()
            VStack(alignment: .leading, spacing: 10) {
                    Text("My Drinks")
                        .font(.title)
                    ScrollView(.horizontal) {
                        HStack(spacing: 20) {
                            
                            VStack {
                                SavedCocktailView()
                                NavigationLink(
                                    destination: CocktailDetailView(),
                                    label: {
                                        Text("Margarita")
                                            .padding()
                                            .background(Color("Foreground"))
                                            .cornerRadius(10)
                                            .foregroundColor(Color("Background"))
                                    })
                            }
                            
                        }
                    }
                }
                .padding()
                .background(Image("neon"))
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
            .background(Color("Background")).ignoresSafeArea()
        }
    }
   
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
