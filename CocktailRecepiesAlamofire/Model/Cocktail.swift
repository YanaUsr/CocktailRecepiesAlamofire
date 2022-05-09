//
//  Cocktail.swift
//  CocktailRecepiesAlamofire
//
//  Created by Яна Иноземцева on 09.05.2022.
//

import Foundation

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
            self.strDrink = cocktailData["strDrink"] as? String
            self.strAlcoholic = cocktailData["strAlcoholic"] as? String
            self.strDrinkThumb = cocktailData["strDrinkThumb"] as? String
            self.strInstructions = cocktailData["strInstructions"] as? String
            self.strIngredient1 = cocktailData["strIngredient1"] as? String
            self.strIngredient2 = cocktailData["strIngredient2"] as? String
            self.strIngredient3 = cocktailData["strIngredient3"] as? String
            self.strIngredient4 = cocktailData["strIngredient4"] as? String
            self.strIngredient5 = cocktailData["strIngredient5"] as? String
            self.strIngredient6 = cocktailData["strIngredient6"] as? String
            self.strIngredient7 = cocktailData["strIngredient7"] as? String
            self.strIngredient8 = cocktailData["strIngredient8"] as? String
            self.strIngredient9 = cocktailData["strIngredient9"] as? String
            self.strIngredient10 = cocktailData["strIngredient10"] as? String
            self.strIngredient11 = cocktailData["strIngredient11"] as? String
            self.strIngredient12 = cocktailData["strIngredient12"] as? String
            self.strIngredient13 = cocktailData["strIngredient13"] as? String
            self.strIngredient14 = cocktailData["strIngredient14"] as? String
            self.strIngredient15 = cocktailData["strIngredient15"] as? String
        }
    
    static func getCocktails(from value: Any) -> [Cocktail] {
        guard let cocktailsData = value as? [[String: Any]] else { return [] }
        return cocktailsData.compactMap { Cocktail(cocktailData: $0) }
    }
    
}

struct Drink: Codable {
    let drinks: [Cocktail]
    
    static func getDrink(from value: Any) -> Drink {
        guard let drink = value as? [String : Any] else { return Drink(drinks: []) }
        guard let drinksDictionary = drink["drinks"] as? [[String : Any]] else { return Drink(drinks: []) }
        return Drink(drinks: Cocktail.getCocktails(from: drinksDictionary))
    }
   
}
