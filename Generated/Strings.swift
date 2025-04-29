// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum Strings {
  /// Advantage Fintech
  internal static let advanceFintech = Strings.tr("Localizable", "advance_fintech", fallback: "Advantage Fintech")
  /// All Movies
  internal static let allMovies = Strings.tr("Localizable", "all_movies", fallback: "All Movies")
  /// Cast
  internal static let cast = Strings.tr("Localizable", "cast", fallback: "Cast")
  /// Try searching with a different keyword or check your connection.
  internal static let emptyContentMessage = Strings.tr("Localizable", "empty_content_message", fallback: "Try searching with a different keyword or check your connection.")
  /// Localizable.strings
  ///   Advantage
  /// 
  ///   Created by Paris Makris on 25/4/25.
  internal static let hello = Strings.tr("Localizable", "hello", fallback: "Hello 🖐️")
  /// No Movies Found
  internal static let noMovies = Strings.tr("Localizable", "no_movies", fallback: "No Movies Found")
  /// Popular
  internal static let popular = Strings.tr("Localizable", "popular", fallback: "Popular")
  /// Search for movies
  internal static let searchMovies = Strings.tr("Localizable", "search_movies", fallback: "Search for movies")
  /// Top Rated
  internal static let topRated = Strings.tr("Localizable", "top_rated", fallback: "Top Rated")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension Strings {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
