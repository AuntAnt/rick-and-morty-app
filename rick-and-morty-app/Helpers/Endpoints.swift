//
//  Endpoints.swift
//  rick-and-morty-app
//
//  Created by Anton Kuzmin on 10.09.2022.
//

import Foundation

//MARK: URLs
struct Endpoints {
    
    static let BASE_URL = "https://rickandmortyapi.com/api/"
}

//MARK: Pages
enum Page: String {
    
    case character = "character/"
    case location = "location/"
    case episode = "episode/"
}

//MARK: Query params
enum Param: String {

    case name = "?name="
}
