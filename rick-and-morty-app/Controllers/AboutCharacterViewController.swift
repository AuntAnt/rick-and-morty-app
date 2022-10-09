//
//  AboutCharacterViewController.swift
//  rick-and-morty-app
//
//  Created by Anton Kuzmin on 09.10.2022.
//

import Foundation
import UIKit

class AboutCharacterViewController: UIViewController {
    
    let characterImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let characterName: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.font = UIFont.boldSystemFont(ofSize: 30)
        return name
    }()
    
    let characterStatus: UILabel = {
        let status = UILabel()
        status.translatesAutoresizingMaskIntoConstraints = false
        return status
    }()
    
    let characterSpecies: UILabel = {
        let species = UILabel()
        species.translatesAutoresizingMaskIntoConstraints = false
        return species
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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension AboutCharacterViewController {
    
    func addConstraints() {
        view.addSubview(characterImage)
        view.addSubview(characterName)
        
        NSLayoutConstraint.activate([
            characterImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            characterImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            characterImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            characterImage.heightAnchor.constraint(equalToConstant: 350),
            characterImage.widthAnchor.constraint(equalToConstant: 350),
            
            characterName.topAnchor.constraint(equalTo: characterImage.bottomAnchor, constant: 20),
            characterName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
    }
}
