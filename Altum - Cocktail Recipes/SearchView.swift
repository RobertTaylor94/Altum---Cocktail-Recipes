//
//  SearchView.swift
//  Altum - Cocktail Recipes
//
//  Created by Robert Taylor on 04/05/2021.
//

import SwiftUI
import SDWebImageSwiftUI
import RealmSwift

struct SearchView: View {
    
    @ObservedObject var networkManager = NetworkManager(search: "")
    @State private var searchText = ""
    @State private var showCancelButton: Bool = false
    let realm = try! Realm()

    
    var body: some View {
        VStack {
            HStack {
                HStack {
                    Image(systemName: "magnifyingglass")
                    
                    TextField("search", text: $searchText, onEditingChanged: { isEditing in
                        self.showCancelButton = true
                    }, onCommit: {
                        self.networkManager.getJsonData(string: searchText)
                    }).foregroundColor(.primary).keyboardType(.webSearch)
                    
                    Button(action: {
                        self.searchText = ""
                    }) {
                        Image(systemName: "xmark.circle.fill").opacity(searchText == "" ? 0 : 1)
                    }
                }
                .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
                .foregroundColor(.secondary)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(10.0)
                
                if showCancelButton  {
                    Button("Cancel") {
                        UIApplication.shared.endEditing(true)
                        self.searchText = ""
                        self.showCancelButton = false
                    }
                    .foregroundColor(Color(.systemBlue))
                }
            }
            .padding(.horizontal)
            .navigationBarHidden(showCancelButton) // .animation(.default) // animation does not work properly
            
            List(networkManager.drinks) { i in
                HStack {
                    WebImage(url: URL(string: i.strDrinkThumb)).resizable().frame(width: 100, height: 100).cornerRadius(20)
                    VStack {
                        Button(action: {
                            
                            let newDrink = DBDrink()
                            newDrink.strDrink = i.strDrink
                            newDrink.strDrinkThumb = i.strDrinkThumb
                            newDrink.strGlass = i.strGlass
                            newDrink.strIngredient1 = i.strIngredient1 ?? ""
                            newDrink.strIngredient2 = i.strIngredient2 ?? ""
                            newDrink.strIngredient3 = i.strIngredient3 ?? ""
                            newDrink.strIngredient4 = i.strIngredient4 ?? ""
                            newDrink.strIngredient5 = i.strIngredient5 ?? ""
                            newDrink.strInstructions = i.strInstructions
                            newDrink.strMeasure1 = i.strMeasure1 ?? ""
                            newDrink.strMeasure2 = i.strMeasure2 ?? ""
                            newDrink.strMeasure3 = i.strMeasure3 ?? ""
                            newDrink.strMeasure4 = i.strMeasure4 ?? ""
                            newDrink.strMeasure5 = i.strMeasure5 ?? ""
                            
                            self.saveDrink(drink: newDrink)
                            
                        }, label: {
                            Text(i.strDrink).font(.title)
                        })
                        Text(i.strInstructions).font(.caption).lineLimit(4)
                    }
                }
            }
            .resignKeyboardOnDragGesture()
            
        }
    }
    
    func saveDrink(drink: DBDrink) {
        do {
            try realm.write {
                realm.add(drink)
            }
        } catch {
            print("Error saving contect \(error)")
        }
    }
    
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

extension UIApplication {
    func endEditing(_ force: Bool) {
        self.windows
            .filter{$0.isKeyWindow}
            .first?
            .endEditing(force)
    }
}

struct ResignKeyboardOnDragGesture: ViewModifier {
    var gesture = DragGesture().onChanged{_ in
        UIApplication.shared.endEditing(true)
    }
    func body(content: Content) -> some View {
        content.gesture(gesture)
    }
}

extension View {
    func resignKeyboardOnDragGesture() -> some View {
        return modifier(ResignKeyboardOnDragGesture())
    }
}

