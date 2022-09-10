//
//  Endpoints.swift
//  rick-and-morty-app
//
//  Created by Anton Kuzmin on 10.09.2022.
//

import Foundation

struct Endpoints {
    
    static let BASE_URL = "https://rickandmortyapi.com/api/"
}

enum Page: String {
    
    case character = "character"
    case location = "location"
    case episode = "episode"
}
