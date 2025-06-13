// The Swift Programming Language

import Foundation
import CoreLocation

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
    
    /// Returns the current season based on the given date and latitude.
    /// - Parameters:
    ///   - date: The date to evaluate. Defaults to the current date.
    ///   - latitude: The latitude to consider
    /// - Returns: The current season.
    public static func currentSeason(latitude: Double, date: Date = Date()) -> Season {
        let hemisphere: Hemisphere = latitude >= 0 ? .north : .south
        return currentSeason(for: date, hemisphere: hemisphere)
    }
    
    /// Returns the current season based on the given date and CLLocation.
    /// - Parameters:
    ///   - date: The date to evaluate. Defaults to the current date.
    ///   - location: The location from CLLocation
    /// - Returns: The current season.
    public static func currentSeason(from location: CLLocation, date: Date = Date()) -> Season {
        let latitude = location.coordinate.latitude
        let hemisphere: Hemisphere = latitude >= 0 ? .north : .south
        return currentSeason(for: date, hemisphere: hemisphere)
    }

    /// Returns the dates of the season based on the given date and hemisphere.
    /// - Parameters:
    ///   - date: The date to evaluate. Defaults to the current date.
    ///   - location: The location from CLLocation
    /// - Returns: The current season.
    public static func seasonDates(for date: Date = Date(), hemisphere: Hemisphere) -> (start: Date, end: Date)? {
        let season = currentSeason(for: date, hemisphere: hemisphere)
        let calendar = Calendar.current
        var components = DateComponents(year: calendar.component(.year, from: date))
        
        switch (season, hemisphere) {
        case (.spring, .north):
            components.month = 3; components.day = 20
            let start = calendar.date(from: components)!
            components.month = 6; components.day = 20
            let end = calendar.date(from: components)!
            return (start, end)
        default:
            return nil
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
