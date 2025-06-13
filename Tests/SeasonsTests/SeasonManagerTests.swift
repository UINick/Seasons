import XCTest
import CoreLocation
@testable import Seasons

final class SeasonManagerTests: XCTestCase {
    
    private func createDate(month: Int, day: Int, year: Int = 2024) -> Date {
        var components = DateComponents()
        components.year = year
        components.month = month
        components.day = day
        return Calendar(identifier: .gregorian).date(from: components)!
    }
    
    private func dateFrom(month: Int, day: Int, year: Int = 2025) -> Date {
        var components = DateComponents()
        components.day = day
        components.month = month
        components.year = year
        return Calendar.current.date(from: components)!
    }
    
    func testNorthHemisphere_EquinoxMarch21() {
        let date = dateFrom(month: 3, day: 21)
        let season = SeasonManager.currentSeason(for: date ,hemisphere: .north)
        XCTAssertEqual(season, .spring)
    }
    
    func testSouthHemisphere_July15() {
        let date = dateFrom(month: 7, day: 15)
        let season = SeasonManager.currentSeason(for: date, hemisphere: .south)
        XCTAssertEqual(season, .winter)
    }
    
    func testSpring_RawValue() {
        let date = dateFrom(month: 4, day: 1)
        let season = SeasonManager.currentSeason(for: date, hemisphere: .north)
        XCTAssertEqual(season.rawValue, "Spring")
    }
    
    func testCurrentSeason_LatitudeNorth_ShouldReturnSummer() {
        let date = createDate(month: 7, day: 10)
        let season = SeasonManager.currentSeason(latitude: 45.0, date: date)
        XCTAssertEqual(season, .summer)
    }

    func testCurrentSeason_LatitudeSouth_ShouldReturnWinter() {
        let date = createDate(month: 7, day: 10)
        let season = SeasonManager.currentSeason(latitude: -23.0, date: date)
        XCTAssertEqual(season, .winter)
    }

    func testCurrentSeason_FromLocation_ShouldReturnAutumn() {
        let date = createDate(month: 10, day: 15)
        let location = CLLocation(latitude: 40.0, longitude: -73.0)
        let season = SeasonManager.currentSeason(from: location, date: date)
        XCTAssertEqual(season, .autumn)
    }

    func testSeasonDates_SpringNorthHemisphere() {
        let date = createDate(month: 4, day: 15)
        let result = SeasonManager.seasonDates(for: date, hemisphere: .north)

        XCTAssertEqual(result?.start, createDate(month: 3, day: 20))
        XCTAssertEqual(result?.end, createDate(month: 6, day: 20))
    }
}
