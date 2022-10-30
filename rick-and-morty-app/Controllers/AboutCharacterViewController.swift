//
//  AboutCharacterViewController.swift
//  rick-and-morty-app
//
//  Created by Anton Kuzmin on 09.10.2022.
//

import Foundation
import UIKit

class AboutCharacterViewController: UIViewController {
    
    //MARK: - Labels
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
    
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(15)
        label.text = Constants.statusLabel
        return label
    }()
    
    private let characterStatus: UILabel = {
        let status = UILabel()
        status.translatesAutoresizingMaskIntoConstraints = false
        status.font = status.font.withSize(20)
        return status
    }()
    
    private let statusIndicator: UIView = {
        let indicator = UIView()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.layer.cornerRadius = 5
        return indicator
    }()
    
    private let speciesLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(15)
        label.text = Constants.speciesLabel
        return label
    }()
    
    private let characterSpecies: UILabel = {
        let species = UILabel()
        species.translatesAutoresizingMaskIntoConstraints = false
        species.font = species.font.withSize(20)
        return species
    }()
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(15)
        label.text = Constants.locationLabel
        return label
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
    
    // MARK: - View initializers
    init(character: SearchResponse.Character) {
        super.init(nibName: nil, bundle: nil)
        self.characterImage.getImageFromUrl(imageUrl: character.image)
        self.characterName.text = character.name
        self.characterStatus.text = character.status.rawValue
        self.characterSpecies.text = character.species
        self.lastKnownLoacation.text = character.locationName
        self.statusIndicator.backgroundColor = StatusColor.identifyStatusColor(characterStatus: character.status)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - extension for constraints
extension AboutCharacterViewController {
    
    func addConstraints() {
        view.addSubview(characterImage)
        view.addSubview(characterName)
        
        view.addSubview(statusLabel)
        view.addSubview(characterStatus)
        view.addSubview(statusIndicator)
        
        view.addSubview(speciesLabel)
        view.addSubview(characterSpecies)
        
        view.addSubview(locationLabel)
        view.addSubview(lastKnownLoacation)
        
        NSLayoutConstraint.activate([
            characterImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            characterImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            characterImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            characterImage.heightAnchor.constraint(equalToConstant: 350),
            characterImage.widthAnchor.constraint(equalToConstant: 350),
            
            characterName.topAnchor.constraint(equalTo: characterImage.bottomAnchor, constant: 20),
            characterName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            statusLabel.topAnchor.constraint(equalTo: characterName.bottomAnchor, constant: 20),
            statusLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            statusIndicator.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 10),
            statusIndicator.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            statusIndicator.heightAnchor.constraint(equalToConstant: 10),
            statusIndicator.widthAnchor.constraint(equalToConstant: 10),
            
            characterStatus.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 3),
            characterStatus.leadingAnchor.constraint(equalTo: statusIndicator.leadingAnchor, constant: 18),
            
            speciesLabel.topAnchor.constraint(equalTo: characterStatus.bottomAnchor, constant: 20),
            speciesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            characterSpecies.topAnchor.constraint(equalTo: speciesLabel.bottomAnchor, constant: 3),
            characterSpecies.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            locationLabel.topAnchor.constraint(equalTo: characterSpecies.bottomAnchor, constant: 20),
            locationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            lastKnownLoacation.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 3),
            lastKnownLoacation.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
    }
}
