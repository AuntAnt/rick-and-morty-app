//
//  NetworkDataFetcher.swift
//  rick-and-morty-app
//
//  Created by Anton Kuzmin on 17.09.2022.
//

import Foundation

class NetworkDataFetcher {
    
    let networkService = Network()
    
    func fetchedCharacters(url: String, response: @escaping (SearchResponse?) -> Void) {
        networkService.request(url: url) { (result) in
            switch result {
            case .success(let data):
                do {
                    let result = try JSONDecoder().decode(SearchResponse.self, from: data)
                    response(result)
                } catch let jsonError {
                    print("Decode json is faled", jsonError)
                    response(nil)
                }
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
                response(nil)
            }
        }
    }
}
