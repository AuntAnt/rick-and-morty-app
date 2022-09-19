//
//  CharacterTableViewCell.swift
//  rick-and-morty-app
//
//  Created by Anton Kuzmin on 17.09.2022.
//

import UIKit

class CharacterTableCell: UITableViewCell {
    
    var characterImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    var characterName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCellConfigurations()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(_ character: Character) {
        self.characterName.text = character.name
        
        self.characterImage.getImageFromUrl(imageUrl: character.image)
    }
}

extension CharacterTableCell {
    
    private func setupCellConfigurations() {
        contentView.addSubview(characterImage)
        contentView.addSubview(characterName)
        
        NSLayoutConstraint.activate([
            characterImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2),
            characterImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            characterImage.heightAnchor.constraint(equalToConstant: 40),
            characterImage.widthAnchor.constraint(equalToConstant: 40),
            
            characterName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            characterName.leadingAnchor.constraint(equalTo: characterImage.trailingAnchor, constant: 10),
            characterName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}
