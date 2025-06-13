# Changelog

All notable changes to this project will be documented in this file.

## [1.0.2] - 2025-06-13
### Added
- `currentSeason(latitude:)`: Automatically detect the hemisphere based on latitude
- `seasonDates(for:)`: Returns the start and end dates of the current season
- `Date.season(...)`: Extensions for retrieving season directly from `Date`

## [1.0.1] - 2025-06-13
### Added
- Added support for detecting the current season based on date and hemisphere
- Integrated multilingual localization: English, Portuguese (pt-BR), and Spanish (es)
- Provided .localized helper for automatic translation of season names
- Fully compatible with Swift Package Manager (SPM)
- Includes unit tests and developer documentation


## [1.0.0] - 2025-06-13
### Added
- Initial stable release with support for season detection
- Localization (EN, PT-BR, ES)
- Swift Package Manager (SPM) support
