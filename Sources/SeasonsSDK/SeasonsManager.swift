// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

/// A manager that provides the current season based on date and hemisphere.
public struct SeasonManager {
    
    /// Returns the current season based on the given date and hemisphere.
    /// - Parameters:
    ///   - date: The date to evaluate. Defaults to the current date.
    ///   - hemisphere: The hemisphere to consider (north or south).
    /// - Returns: The current season.
    public static func currentSeason(for date: Date = Date(), hemisphere: Hemisphere) -> Season {
        let component = Calendar.current.dateComponents([.month, .day], from: date)
        guard let month = component.month, let day = component.day else { return .winter }
        
        switch hemisphere {
        case .north:
            return getNorthSeason(component:(month,day))
        case .south:
            return  getSouthSeason(component:(month,day))
        }
    }
    
    private static func getNorthSeason(component chosen: (month: Int, day: Int)) -> Season {
        switch (chosen.month, chosen.day) {
        case (3, 20...), (4, _), (5, _), (6, 1..<21):
            return .spring
        case (6, 21...), (7, _), (8, _), (9, 1..<23):
            return .summer
        case (9, 23...), (10, _), (11, _), (12, 1..<21):
            return .autumn
        default:
            return .winter
        }
    }
    
    private static func getSouthSeason(component chosen: (month: Int, day: Int)) -> Season {
        switch (chosen.month, chosen.day) {
        case (3, 20...), (4, _), (5, _), (6, 1..<21):
            return .autumn
        case (6, 21...), (7, _), (8, _), (9, 1..<23):
            return .winter
        case (9, 23...), (10, _), (11, _), (12, 1..<21):
            return .spring
        default:
            return .summer
        }
    }
}
