import XCTest
@testable import Seasons

final class SeasonManagerTests: XCTestCase {
    
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
}
