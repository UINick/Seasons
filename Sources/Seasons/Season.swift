//
//  File.swift
//  
//
//  Created by Nicholas Forte on 13/06/25.
//

import Foundation

/// Represents the four seasons of the year.
public enum Season: String {
    case summer = "Summer"
    case spring = "Spring"
    case autumn = "Autumn"
    case winter = "Winter"
    
    public var localized: String {
        NSLocalizedString(self.rawValue, bundle: .module, comment: "")
    }
}
