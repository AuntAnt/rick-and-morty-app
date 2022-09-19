//
//  UIImageView.swift
//  rick-and-morty-app
//
//  Created by Anton Kuzmin on 19.09.2022.
//

import Foundation
import UIKit

// MARK: - extension for getting image from url or from cache if image present there
extension UIImageView {
    
    func getImageFromUrl(imageUrl: String) {
        guard let url = URL(string: imageUrl) else { return }
        
        DispatchQueue.main.async { [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                
                if let cacheData = CacheManager.getImageCache(url) {
                    self?.image = cacheData
                    return
                }
                
                if let loadedImage = UIImage(data: imageData) {
                    CacheManager.setImageCache(url, loadedImage)
                    self?.image = loadedImage
                }
            }
        }
    }
}
