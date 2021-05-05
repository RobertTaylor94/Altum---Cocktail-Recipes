//
//  DrinkOfTheDayView.swift
//  Altum - Cocktail Recipes
//
//  Created by Robert Taylor on 04/05/2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct RandomDrinkView: View {
    
    @State var title: String = ""
    @State var ing1: String = ""
    @State var ing2: String = ""
    @State var ing3: String = ""
    @State var ing4: String = ""
    @State var ing5: String = ""
    @State var thumb: String = ""
    @State var instructions: String = ""
    
    var body: some View {
        

        VStack(spacing: 20) {
            Text("Why not try...")
            Text(title).font(.title)
            Text("\(ing1), \(ing2), \(ing3), \(ing4), \(ing5)").font(.caption)
            WebImage(url: URL(string: thumb)).resizable().frame(width: 100, height: 100).cornerRadius(20)
            Text(instructions).font(.caption)
        }.padding().frame(width: 300, height: 300).cornerRadius(20)
        
        
    }
}

struct DrinkOfTheDayView_Previews: PreviewProvider {
    static var previews: some View {
        RandomDrinkView()
    }
}
