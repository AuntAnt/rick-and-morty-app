//
//  CharacterResponse.swift
//  rick-and-morty-app
//
//  Created by Anton Kuzmin on 14.09.2022.
//

import Foundation

struct SearchResponse: Decodable {
    
    ///TODO uncomment it for pagination
//    let info: Info?
    let results: [Character]?
}

enum Status: String, Decodable {
    case Alive, Dead, unknown
}

extension SearchResponse {
    
    struct Character: Decodable {
        let name: String
        let status: Status
        let species: String
        let gender: String
        let locationName: String
        let image: String

        enum CodingKeys: String, CodingKey {
            case location
            case name, status, species, gender, image
        }

        init(from decoder: Decoder) throws {
            // Get root response container
            let container = try decoder.container(keyedBy: CodingKeys.self)

            // Decode properties from root container
            self.name = try container.decode(String.self, forKey: .name)
            self.status = try container.decode(Status.self, forKey: .status)
            self.species = try container.decode(String.self, forKey: .species)
            self.gender = try container.decode(String.self, forKey: .gender)
            self.image = try container.decode(String.self, forKey: .image)

            // Get location container from root
            let location = try container.nestedContainer(
                keyedBy: CodingKeys.self,
                forKey: .location
            )

            // Decode location name from location container
            self.locationName = try location.decode(String.self, forKey: .name)
        }
    }

    ///TODO: uncomment it for pagination
//    struct Info: Decodable {
//
//        let count: Int
//        let pages: Int
//        let next: String?
//        let prev: String?
//    }
}
