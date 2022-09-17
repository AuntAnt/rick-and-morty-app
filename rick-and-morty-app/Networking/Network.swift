//
//  Model.swift
//  rick-and-morty-app
//
//  Created by Anton Kuzmin on 11.09.2022.
//

import Foundation

class Network {
    
    func request(url: String, completion: @escaping (Result<Data, Error>) -> Void) {
        
        // Creating url and checking it is not nil, else exit the method
        guard let url = URL(string: url) else { return }
        print(url)
        
        // Creating new task
        let dataTask = URLSession.shared.dataTask(with: url) { data, response, error in
            
            // Loading data in async tread, and interface is not lagging
            DispatchQueue.main.async {
                if error != nil {
                    completion(.failure(error!))
                    return
                }
                guard let data = data else {
                    return
                }
                completion(.success(data))
            }
        }
        
        // Run the task
        dataTask.resume()
    }
}
