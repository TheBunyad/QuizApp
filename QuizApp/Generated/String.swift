// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// Animals
  internal static let animals = L10n.tr("Localizable", "animals", fallback: #"Animals"#)
  /// Any Category
  internal static let anyCategory = L10n.tr("Localizable", "any_category", fallback: #"Any Category"#)
  /// QuizApp
  internal static let appTitleName = L10n.tr("Localizable", "app_title_name", fallback: #"QuizApp"#)
  /// Art
  internal static let art = L10n.tr("Localizable", "art", fallback: #"Art"#)
  /// Celebrities
  internal static let celebrities = L10n.tr("Localizable", "celebrities", fallback: #"Celebrities"#)
  /// Entertainment: Japanese Anime & Manga
  internal static let entertainmentAnimeManga = L10n.tr("Localizable", "entertainment_anime_manga", fallback: #"Entertainment: Japanese Anime & Manga"#)
  /// Entertainment: Board Games
  internal static let entertainmentBoardGames = L10n.tr("Localizable", "entertainment_board_games", fallback: #"Entertainment: Board Games"#)
  /// Entertainment: Books
  internal static let entertainmentBooks = L10n.tr("Localizable", "entertainment_books", fallback: #"Entertainment: Books"#)
  /// Entertainment: Cartoons & Animations
  internal static let entertainmentCartoonAnimations = L10n.tr("Localizable", "entertainment_cartoon_animations", fallback: #"Entertainment: Cartoons & Animations"#)
  /// Entertainment: Comics
  internal static let entertainmentComics = L10n.tr("Localizable", "entertainment_comics", fallback: #"Entertainment: Comics"#)
  /// Entertainment: Film
  internal static let entertainmentFilm = L10n.tr("Localizable", "entertainment_film", fallback: #"Entertainment: Film"#)
  /// Entertainment: Music
  internal static let entertainmentMusic = L10n.tr("Localizable", "entertainment_music", fallback: #"Entertainment: Music"#)
  /// Entertainment: Musical & Theatres
  internal static let entertainmentMusicalAndTheatres = L10n.tr("Localizable", "entertainment_musical_and_theatres", fallback: #"Entertainment: Musical & Theatres"#)
  /// Entertainment: Television
  internal static let entertainmentTelevision = L10n.tr("Localizable", "entertainment_television", fallback: #"Entertainment: Television"#)
  /// Entertainment: Video Games
  internal static let entertainmentVideoGames = L10n.tr("Localizable", "entertainment_video_games", fallback: #"Entertainment: Video Games"#)
  /// General Knowledge
  internal static let generalKnowledge = L10n.tr("Localizable", "general_knowledge", fallback: #"General Knowledge"#)
  /// Geography
  internal static let geography = L10n.tr("Localizable", "geography", fallback: #"Geography"#)
  /// History
  internal static let history = L10n.tr("Localizable", "history", fallback: #"History"#)
  /// the.bunyad@gmail.com
  internal static let mail = L10n.tr("Localizable", "mail", fallback: #"the.bunyad@gmail.com"#)
  /// Mythology
  internal static let mythology = L10n.tr("Localizable", "mythology", fallback: #"Mythology"#)
  /// Localizable.strings
  ///   QuizApp
  /// 
  ///   Created by Bunyad Majidzade on 30.08.22.
  internal static let name = L10n.tr("Localizable", "name", fallback: #"Bunyad"#)
  /// 11111111
  internal static let password = L10n.tr("Localizable", "password", fallback: #"11111111"#)
  /// Politics
  internal static let politics = L10n.tr("Localizable", "politics", fallback: #"Politics"#)
  /// Science: Computers
  internal static let scienceComputers = L10n.tr("Localizable", "science_computers", fallback: #"Science: Computers"#)
  /// Science: Gadgets
  internal static let scienceGadgets = L10n.tr("Localizable", "science_gadgets", fallback: #"Science: Gadgets"#)
  /// Science: Mathematics
  internal static let scienceMathematics = L10n.tr("Localizable", "science_mathematics", fallback: #"Science: Mathematics"#)
  /// Science & Nature
  internal static let scienceNature = L10n.tr("Localizable", "science_nature", fallback: #"Science & Nature"#)
  /// Sports
  internal static let sports = L10n.tr("Localizable", "sports", fallback: #"Sports"#)
  /// Vehicles
  internal static let vehicles = L10n.tr("Localizable", "vehicles", fallback: #"Vehicles"#)
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
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
