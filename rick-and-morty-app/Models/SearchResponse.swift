//
//  CharacterResponse.swift
//  rick-and-morty-app
//
//  Created by Anton Kuzmin on 14.09.2022.
//

import Foundation

struct SearchResponse: Decodable {
    
    let results: [Character]?
    
    enum CodingKeys: String, CodingKey {
        case results
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.results = try container.decode([Character].self, forKey: .results)
    }
}
