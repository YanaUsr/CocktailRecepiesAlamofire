//
//  MargaritaCell.swift
//  CocktailRecepiesAlamofire
//
//  Created by Яна Иноземцева on 09.05.2022.
//

import UIKit

class MargaritaCell: UITableViewCell {

    
    @IBOutlet var nameOfMargaritaLabel: UILabel!
    @IBOutlet var margaritaImage: UIImageView!
    @IBOutlet var typeOfCoctailLabel: UILabel!
    
    
    func configure(with cocktail: Cocktail) {
        
        nameOfMargaritaLabel.text = cocktail.strDrink
        typeOfCoctailLabel.text = cocktail.strAlcoholic
        
        
        if let url = cocktail.strDrinkThumb {
            NetworkManager.shared.fetchImage(from: url) { result in
                switch result {
                case .success(let imageData):
                    self.margaritaImage.image = UIImage(data: imageData)
                case .failure(let error):
                    print(error)
                }
            }
        }
        
    }
}
