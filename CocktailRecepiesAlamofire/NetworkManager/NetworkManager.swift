//
//  NetworkManager.swift
//  CocktailRecepiesAlamofire
//
//  Created by Яна Иноземцева on 09.05.2022.
//

import Foundation
import Alamofire

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchImage(from url: String, completion: @escaping (Result<Data, NetworkError>) -> Void)  {
        AF.request(url)
            .validate()
            .responseData { response in
                switch response.result {
                case .success(let data):
                    completion(.success(data))
                case .failure(_):
                    completion(.failure(.decodingError))
                }
            }
    }
    
    func fetchDataWithAlamofire(completion: @escaping(Result<[Cocktail], NetworkError>) -> Void) {
        AF.request("https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita")
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    let drink = Drink.getDrink(from: value)
                    let margaritas = drink.drinks
                    completion(.success(margaritas))
                case .failure(let error):
                    print(error)
                    completion(.failure(.decodingError))
                }
            }
        
    }
}
