//
//  HomeView.swift
//  Altum - Cocktail Recipes
//
//  Created by Robert Taylor on 04/05/2021.
//

import SwiftUI
import RealmSwift

struct HomeView: View {
    
    @ObservedObject var networkManager = NetworkManager(search: "")
    @ObservedObject var randomDrinkManager = RandomDrinkManager()
    @State private var drinks: Results<DBDrink>?
    let realm = try! Realm()
    
    var body: some View {

        NavigationView {
        VStack {
                Spacer()
            VStack(alignment: .leading, spacing: 10) {
                    Text("My Drinks")
                        .font(.title)
                ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            
                            if drinks != nil {
                                ForEach(drinks!) { i in
                                    VStack {
                                        SavedCocktailView(imageUrl: i.strDrinkThumb)
                                        NavigationLink(
                                            destination: CocktailDetailView(strDrink: i.strDrink),
                                            label: {
                                                Text(i.strDrink)
                                                    .padding()
                                                    .background(Color("Foreground"))
                                                    .cornerRadius(10)
                                                    .foregroundColor(Color("Background"))
                                            })
                                    }
                                }
                            } else {
                                
                            }
                        }
                    }
                }
                .padding()
                .background(Image("neon"))
                .foregroundColor(.white)
                .cornerRadius(20)
                .onAppear(){loadDrinks()}
                
                Spacer()
            ForEach(randomDrinkManager.randomDrink) { i in
                HStack {
                    RandomDrinkView(title: i.strDrink, ing1: i.strIngredient1 ?? "", ing2: i.strIngredient2 ?? "", ing3: i.strIngredient3 ?? "", ing4: i.strIngredient4 ?? "", ing5: i.strIngredient5 ?? "", thumb: i.strDrinkThumb, instructions: i.strInstructions)
                    
                }
                .padding()
                .background(Color.black)
                .foregroundColor(.white)
                .cornerRadius(20)
            }
                
                
                Spacer()
                Spacer()
                Spacer()
            }
            .padding()
            .background(Color("Background")).ignoresSafeArea()
            .onAppear() {self.randomDrinkManager.getRandomDrink()}
        }
    }
   
    func loadDrinks() {
        drinks = realm.objects(DBDrink.self)
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
