//
//  AboutCharacterViewController.swift
//  rick-and-morty-app
//
//  Created by Anton Kuzmin on 09.10.2022.
//

import Foundation
import UIKit

class AboutCharacterViewController: UIViewController {
    
    private let characterImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let characterName: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.font = UIFont.boldSystemFont(ofSize: 30)
        return name
    }()
    
    private let characterStatus: UILabel = {
        let status = UILabel()
        status.translatesAutoresizingMaskIntoConstraints = false
        status.font = status.font.withSize(20)
        return status
    }()
    
    private let characterSpecies: UILabel = {
        let species = UILabel()
        species.translatesAutoresizingMaskIntoConstraints = false
        species.font = species.font.withSize(20)
        return species
    }()
    
    private let lastKnownLoacation: UILabel = {
        let location = UILabel()
        location.translatesAutoresizingMaskIntoConstraints = false
        location.font = location.font.withSize(20)
        return location
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        addConstraints()
    }
    
    init(character: Character) {
        super.init(nibName: nil, bundle: nil)
        self.characterImage.getImageFromUrl(imageUrl: character.image)
        self.characterName.text = character.name
        self.characterStatus.text = character.status
        self.characterSpecies.text = character.species
        self.lastKnownLoacation.text = character.locationName
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension AboutCharacterViewController {
    
    func addConstraints() {
        view.addSubview(characterImage)
        view.addSubview(characterName)
        view.addSubview(characterStatus)
        view.addSubview(characterSpecies)
        view.addSubview(lastKnownLoacation)
        
        NSLayoutConstraint.activate([
            characterImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            characterImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            characterImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            characterImage.heightAnchor.constraint(equalToConstant: 350),
            characterImage.widthAnchor.constraint(equalToConstant: 350),
            
            characterName.topAnchor.constraint(equalTo: characterImage.bottomAnchor, constant: 20),
            characterName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            characterStatus.topAnchor.constraint(equalTo: characterName.bottomAnchor, constant: 15),
            characterStatus.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            characterSpecies.topAnchor.constraint(equalTo: characterStatus.bottomAnchor, constant: 15),
            characterSpecies.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            lastKnownLoacation.topAnchor.constraint(equalTo: characterSpecies.bottomAnchor, constant: 15),
            lastKnownLoacation.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
    }
}
