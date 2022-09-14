//
//  Character.swift
//  rick-and-morty-app
//
//  Created by Anton Kuzmin on 12.09.2022.
//

import Foundation

struct Character: Decodable {
    
    var name: String
    var status: String
    var species: String
    var gender: String
    var locationName: String
    var image: String
    
    enum CodingKeys: String, CodingKey {
        
        case location
        
        case name, status, species, gender, image
    }
    
    init(from decoder: Decoder) throws {
        // Get root response container
        let container = try decoder.container(keyedBy: CodingKeys.self)
    
        // Decode properties from root containder
        self.name = try container.decode(String.self, forKey: .name)
        self.status = try container.decode(String.self, forKey: .status)
        self.species = try container.decode(String.self, forKey: .species)
        self.gender = try container.decode(String.self, forKey: .gender)
        self.image = try container.decode(String.self, forKey: .image)
        
        // Get location container from root
        let location = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .location)
        
        // Decode location name from location container
        self.locationName = try location.decode(String.self, forKey: .name)
    }
}
