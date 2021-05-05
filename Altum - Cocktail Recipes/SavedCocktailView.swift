//
//  SavedCocktailView.swift
//  Altum - Cocktail Recipes
//
//  Created by Robert Taylor on 04/05/2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct SavedCocktailView: View {
    
    @State var imageUrl: String = ""
    
    var body: some View {

                VStack(spacing: 10) {
                    if imageUrl != "" {
                        WebImage(url: URL(string: imageUrl)).resizable().frame(width: 100, height: 100).cornerRadius(20)
                    } else {
                        Image(systemName: "hourglass").resizable().frame(width: 100, height: 100)
                    }
                }
                .padding()
                .background(Color("Foreground"))
                .cornerRadius(20)
                .foregroundColor(Color("Background"))
            }
        }

struct SavedCocktailView_Previews: PreviewProvider {
    static var previews: some View {
        SavedCocktailView()
    }
}


