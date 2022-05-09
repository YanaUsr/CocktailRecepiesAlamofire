//
//  DetailedInformation.swift
//  CocktailRecepiesAlamofire
//
//  Created by Яна Иноземцева on 09.05.2022.
//

import UIKit

class DetailedInformation: UIViewController {

    @IBOutlet var imageMargarita: UIImageView!
    @IBOutlet var recepyLabel: UILabel!
    @IBOutlet var ingridientsLabel: UILabel!
    
    var cocktail: Cocktail?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()

    }
    
    
    func configure() {
        
        recepyLabel.text = cocktail?.strInstructions
        ingridientsLabel.text = cocktail?.composition
        
        if let url = cocktail?.strDrinkThumb {
            NetworkManager.shared.fetchImage(from: url) { result in
                switch result {
                case .success(let imageData):
                    self.imageMargarita.image = UIImage(data: imageData)
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
}
