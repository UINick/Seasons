//
//  Date+Extension.swift
//  
//
//  Created by Nicholas Forte on 13/06/25.
//

import Foundation

public extension Date {
    
    /// Returns the current season based on the date itself and hemisphire.
    /// - Parameters:
    ///   - hemisphire: The hemisphire to evaluate.
    /// - Returns: The current season.
    func season(hemisphire: Hemisphere) -> Season {
        SeasonManager.currentSeason(for: self, hemisphere: hemisphire)
    }
    
    /// Returns the current season based on the date itself and latitude.
    /// - Parameters:
    ///   - latitude: The latitude to evaluate.
    /// - Returns: The current season.
    func season(latitude: Double) -> Season {
        SeasonManager.currentSeason(latitude: latitude, date: self)
    }
}
