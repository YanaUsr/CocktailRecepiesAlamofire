//
//  TableViewController.swift
//  CocktailRecepiesAlamofire
//
//  Created by Яна Иноземцева on 09.05.2022.
//

import UIKit

class TableViewController: UITableViewController {
    var cocktails: [Cocktail] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 150
        fetchCocktailReceipt()
        
    }
    
    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        cocktails.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "cocktail", for: indexPath) as? MargaritaCell
        else {
            
            return UITableViewCell()
        }
        let cocktails = cocktails[indexPath.row]
        cell.configure(with: cocktails)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cocktails = cocktails[indexPath.row]
        performSegue(withIdentifier: "toTheRecipe", sender: cocktails)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let selectedCocktailVC = segue.destination as? DetailedInformation else { return }
        selectedCocktailVC.cocktail = sender as? Cocktail
        
    }
    
    private func fetchCocktailReceipt() {
        NetworkManager.shared.fetchDataWithAlamofire { result in
            switch result {
            case .success(let cocktails):
                self.cocktails = cocktails
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
        
    }
}
