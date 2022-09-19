//
//  CacheManager.swift
//  rick-and-morty-app
//
//  Created by Anton Kuzmin on 19.09.2022.
//

import Foundation
import UIKit

class CacheManager {
    
//    static var cache = [URL : Data]()
//
//    static func setImageCache(_ url: URL, _ data: Data?) {
//        cache[url] = data
//    }
//
//    static func getImageCache(_ url: URL) -> Data? {
//        return cache[url]
//    }
    
    
    static var cache = [URL : UIImage]()
    
    static func setImageCache(_ url: URL, _ data: UIImage?) {
        cache[url] = data
    }
    
    static func getImageCache(_ url: URL) -> UIImage? {
        return cache[url]
    }
}
