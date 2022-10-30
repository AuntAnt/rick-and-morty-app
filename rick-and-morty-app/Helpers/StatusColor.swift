//
//  StatusColor.swift
//  rick-and-morty-app
//
//  Created by Anton Kuzmin on 29.10.2022.
//

import Foundation
import UIKit

final class StatusColor {
    
    static func identifyStatusColor(characterStatus status: Status) -> UIColor {
        switch status {
        case .Alive: return .green
        case .Dead: return .red
        default: return .gray
        }
    }
}
