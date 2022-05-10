//
//  Cocktail.swift
//  CocktailRecepiesAlamofire
//
//  Created by Яна Иноземцева on 09.05.2022.
//

import Foundation

struct Drink: Codable {
    let drinks: [Cocktail]
    
    init(drinkData: [String: Any]) {
        
        let drinks = drinkData["drinks"] as? [[String: Any]] ?? []
        self.drinks = drinks.compactMap {Cocktail(cocktailData: $0)}
    }
    
    
    static func getDrink(from value: Any) -> Drink? {
        guard let drinks = value as? [String : Any] else { return nil}
        
        return Drink(drinkData: drinks)
    }
    
}

struct Cocktail: Codable {
    
    let strDrink: String?
    let strAlcoholic: String?
    let strDrinkThumb: String?
    let strInstructions: String?
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strIngredient9: String?
    let strIngredient10: String?
    let strIngredient11: String?
    let strIngredient12: String?
    let strIngredient13: String?
    let strIngredient14: String?
    let strIngredient15: String?

    var composition: String {
        var compositionInStringFormat = "Ingredients:\n"
        let allIngredients = [
            strIngredient1,
            strIngredient2,
            strIngredient3,
            strIngredient4,
            strIngredient5,
            strIngredient6,
            strIngredient7,
            strIngredient8,
            strIngredient9,
            strIngredient10,
            strIngredient11,
            strIngredient12,
            strIngredient13,
            strIngredient14,
            strIngredient15
        ]

        for ingredient in allIngredients {
            if let ingredient = ingredient {
                compositionInStringFormat += "\(ingredient)\n"
            }
        }
        return compositionInStringFormat
    }
    
    init(cocktailData: [String : Any]) {
            strDrink = cocktailData["strDrink"] as? String
            strAlcoholic = cocktailData["strAlcoholic"] as? String
            strDrinkThumb = cocktailData["strDrinkThumb"] as? String
            strInstructions = cocktailData["strInstructions"] as? String
            strIngredient1 = cocktailData["strIngredient1"] as? String
            strIngredient2 = cocktailData["strIngredient2"] as? String
            strIngredient3 = cocktailData["strIngredient3"] as? String
            strIngredient4 = cocktailData["strIngredient4"] as? String
            strIngredient5 = cocktailData["strIngredient5"] as? String
            strIngredient6 = cocktailData["strIngredient6"] as? String
            strIngredient7 = cocktailData["strIngredient7"] as? String
            strIngredient8 = cocktailData["strIngredient8"] as? String
            strIngredient9 = cocktailData["strIngredient9"] as? String
            strIngredient10 = cocktailData["strIngredient10"] as? String
            strIngredient11 = cocktailData["strIngredient11"] as? String
            strIngredient12 = cocktailData["strIngredient12"] as? String
            strIngredient13 = cocktailData["strIngredient13"] as? String
            strIngredient14 = cocktailData["strIngredient14"] as? String
            strIngredient15 = cocktailData["strIngredient15"] as? String
        }
    
}
