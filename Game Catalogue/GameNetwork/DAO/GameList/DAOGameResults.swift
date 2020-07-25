//
//  DAOGameResults.swift
//
//  Created by Amin faruq on 06/07/20
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class DAOGameResults: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let reviewsCount = "reviews_count"
    static let ratingsCount = "ratings_count"
    static let suggestionsCount = "suggestions_count"
    static let addedByStatus = "added_by_status"
    static let tba = "tba"
    static let tags = "tags"
    static let parentPlatforms = "parent_platforms"
    static let shortScreenshots = "short_screenshots"
    static let slug = "slug"
    static let ratings = "ratings"
    static let id = "id"
    static let clip = "clip"
    static let released = "released"
    static let saturatedColor = "saturated_color"
    static let name = "name"
    static let genres = "genres"
    static let playtime = "playtime"
    static let stores = "stores"
    static let platforms = "platforms"
    static let metacritic = "metacritic"
    static let rating = "rating"
    static let ratingTop = "rating_top"
    static let added = "added"
    static let backgroundImage = "background_image"
    static let dominantColor = "dominant_color"
    static let reviewsTextCount = "reviews_text_count"
  }

  // MARK: Properties
  public var reviewsCount: Int?
  public var ratingsCount: Int?
  public var suggestionsCount: Int?
  public var addedByStatus: DAOGameAddedByStatus?
  public var tba: Bool? = false
  public var tags: [DAOGameTags]?
  public var parentPlatforms: [DAOGameParentPlatforms]?
  public var shortScreenshots: [DAOGameShortScreenshots]?
  public var slug: String?
  public var ratings: [DAOGameRatings]?
  public var id: Int?
  public var clip: DAOGameClip?
  public var released: String?
  public var saturatedColor: String?
  public var name: String?
  public var genres: [DAOGameGenres]?
  public var playtime: Int?
  public var stores: [DAOGameStores]?
  public var platforms: [DAOGamePlatforms]?
  public var metacritic: Int?
  public var rating: Float?
  public var ratingTop: Int?
  public var added: Int?
  public var backgroundImage: String?
  public var dominantColor: String?
  public var reviewsTextCount: Int?

  // MARK: SwiftyJSON Initializers
  /// Initiates the instance based on the object.
  ///
  /// - parameter object: The object of either Dictionary or Array kind that was passed.
  /// - returns: An initialized instance of the class.
  public convenience init(object: Any) {
    self.init(json: JSON(object))
  }

  /// Initiates the instance based on the JSON that was passed.
  ///
  /// - parameter json: JSON object from SwiftyJSON.
  public required init(json: JSON) {
    reviewsCount = json[SerializationKeys.reviewsCount].int
    ratingsCount = json[SerializationKeys.ratingsCount].int
    suggestionsCount = json[SerializationKeys.suggestionsCount].int
    addedByStatus = DAOGameAddedByStatus(json: json[SerializationKeys.addedByStatus])
    tba = json[SerializationKeys.tba].boolValue
    if let items = json[SerializationKeys.tags].array { tags = items.map { DAOGameTags(json: $0) } }
    if let items = json[SerializationKeys.parentPlatforms].array { parentPlatforms = items.map { DAOGameParentPlatforms(json: $0) } }
    if let items = json[SerializationKeys.shortScreenshots].array { shortScreenshots = items.map { DAOGameShortScreenshots(json: $0) } }
    slug = json[SerializationKeys.slug].string
    if let items = json[SerializationKeys.ratings].array { ratings = items.map { DAOGameRatings(json: $0) } }
    id = json[SerializationKeys.id].int
    clip = DAOGameClip(json: json[SerializationKeys.clip])
    released = json[SerializationKeys.released].string
    saturatedColor = json[SerializationKeys.saturatedColor].string
    name = json[SerializationKeys.name].string
    if let items = json[SerializationKeys.genres].array { genres = items.map { DAOGameGenres(json: $0) } }
    playtime = json[SerializationKeys.playtime].int
    if let items = json[SerializationKeys.stores].array { stores = items.map { DAOGameStores(json: $0) } }
    if let items = json[SerializationKeys.platforms].array { platforms = items.map { DAOGamePlatforms(json: $0) } }
    metacritic = json[SerializationKeys.metacritic].int
    rating = json[SerializationKeys.rating].float
    ratingTop = json[SerializationKeys.ratingTop].int
    added = json[SerializationKeys.added].int
    backgroundImage = json[SerializationKeys.backgroundImage].string
    dominantColor = json[SerializationKeys.dominantColor].string
    reviewsTextCount = json[SerializationKeys.reviewsTextCount].int
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = reviewsCount { dictionary[SerializationKeys.reviewsCount] = value }
    if let value = ratingsCount { dictionary[SerializationKeys.ratingsCount] = value }
    if let value = suggestionsCount { dictionary[SerializationKeys.suggestionsCount] = value }
    if let value = addedByStatus { dictionary[SerializationKeys.addedByStatus] = value.dictionaryRepresentation() }
    dictionary[SerializationKeys.tba] = tba
    if let value = tags { dictionary[SerializationKeys.tags] = value.map { $0.dictionaryRepresentation() } }
    if let value = parentPlatforms { dictionary[SerializationKeys.parentPlatforms] = value.map { $0.dictionaryRepresentation() } }
    if let value = shortScreenshots { dictionary[SerializationKeys.shortScreenshots] = value.map { $0.dictionaryRepresentation() } }
    if let value = slug { dictionary[SerializationKeys.slug] = value }
    if let value = ratings { dictionary[SerializationKeys.ratings] = value.map { $0.dictionaryRepresentation() } }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = clip { dictionary[SerializationKeys.clip] = value.dictionaryRepresentation() }
    if let value = released { dictionary[SerializationKeys.released] = value }
    if let value = saturatedColor { dictionary[SerializationKeys.saturatedColor] = value }
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = genres { dictionary[SerializationKeys.genres] = value.map { $0.dictionaryRepresentation() } }
    if let value = playtime { dictionary[SerializationKeys.playtime] = value }
    if let value = stores { dictionary[SerializationKeys.stores] = value.map { $0.dictionaryRepresentation() } }
    if let value = platforms { dictionary[SerializationKeys.platforms] = value.map { $0.dictionaryRepresentation() } }
    if let value = metacritic { dictionary[SerializationKeys.metacritic] = value }
    if let value = rating { dictionary[SerializationKeys.rating] = value }
    if let value = ratingTop { dictionary[SerializationKeys.ratingTop] = value }
    if let value = added { dictionary[SerializationKeys.added] = value }
    if let value = backgroundImage { dictionary[SerializationKeys.backgroundImage] = value }
    if let value = dominantColor { dictionary[SerializationKeys.dominantColor] = value }
    if let value = reviewsTextCount { dictionary[SerializationKeys.reviewsTextCount] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.reviewsCount = aDecoder.decodeObject(forKey: SerializationKeys.reviewsCount) as? Int
    self.ratingsCount = aDecoder.decodeObject(forKey: SerializationKeys.ratingsCount) as? Int
    self.suggestionsCount = aDecoder.decodeObject(forKey: SerializationKeys.suggestionsCount) as? Int
    self.addedByStatus = aDecoder.decodeObject(forKey: SerializationKeys.addedByStatus) as? DAOGameAddedByStatus
    self.tba = aDecoder.decodeBool(forKey: SerializationKeys.tba)
    self.tags = aDecoder.decodeObject(forKey: SerializationKeys.tags) as? [DAOGameTags]
    self.parentPlatforms = aDecoder.decodeObject(forKey: SerializationKeys.parentPlatforms) as? [DAOGameParentPlatforms]
    self.shortScreenshots = aDecoder.decodeObject(forKey: SerializationKeys.shortScreenshots) as? [DAOGameShortScreenshots]
    self.slug = aDecoder.decodeObject(forKey: SerializationKeys.slug) as? String
    self.ratings = aDecoder.decodeObject(forKey: SerializationKeys.ratings) as? [DAOGameRatings]
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? Int
    self.clip = aDecoder.decodeObject(forKey: SerializationKeys.clip) as? DAOGameClip
    self.released = aDecoder.decodeObject(forKey: SerializationKeys.released) as? String
    self.saturatedColor = aDecoder.decodeObject(forKey: SerializationKeys.saturatedColor) as? String
    self.name = aDecoder.decodeObject(forKey: SerializationKeys.name) as? String
    self.genres = aDecoder.decodeObject(forKey: SerializationKeys.genres) as? [DAOGameGenres]
    self.playtime = aDecoder.decodeObject(forKey: SerializationKeys.playtime) as? Int
    self.stores = aDecoder.decodeObject(forKey: SerializationKeys.stores) as? [DAOGameStores]
    self.platforms = aDecoder.decodeObject(forKey: SerializationKeys.platforms) as? [DAOGamePlatforms]
    self.metacritic = aDecoder.decodeObject(forKey: SerializationKeys.metacritic) as? Int
    self.rating = aDecoder.decodeObject(forKey: SerializationKeys.rating) as? Float
    self.ratingTop = aDecoder.decodeObject(forKey: SerializationKeys.ratingTop) as? Int
    self.added = aDecoder.decodeObject(forKey: SerializationKeys.added) as? Int
    self.backgroundImage = aDecoder.decodeObject(forKey: SerializationKeys.backgroundImage) as? String
    self.dominantColor = aDecoder.decodeObject(forKey: SerializationKeys.dominantColor) as? String
    self.reviewsTextCount = aDecoder.decodeObject(forKey: SerializationKeys.reviewsTextCount) as? Int
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(reviewsCount, forKey: SerializationKeys.reviewsCount)
    aCoder.encode(ratingsCount, forKey: SerializationKeys.ratingsCount)
    aCoder.encode(suggestionsCount, forKey: SerializationKeys.suggestionsCount)
    aCoder.encode(addedByStatus, forKey: SerializationKeys.addedByStatus)
    aCoder.encode(tba, forKey: SerializationKeys.tba)
    aCoder.encode(tags, forKey: SerializationKeys.tags)
    aCoder.encode(parentPlatforms, forKey: SerializationKeys.parentPlatforms)
    aCoder.encode(shortScreenshots, forKey: SerializationKeys.shortScreenshots)
    aCoder.encode(slug, forKey: SerializationKeys.slug)
    aCoder.encode(ratings, forKey: SerializationKeys.ratings)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(clip, forKey: SerializationKeys.clip)
    aCoder.encode(released, forKey: SerializationKeys.released)
    aCoder.encode(saturatedColor, forKey: SerializationKeys.saturatedColor)
    aCoder.encode(name, forKey: SerializationKeys.name)
    aCoder.encode(genres, forKey: SerializationKeys.genres)
    aCoder.encode(playtime, forKey: SerializationKeys.playtime)
    aCoder.encode(stores, forKey: SerializationKeys.stores)
    aCoder.encode(platforms, forKey: SerializationKeys.platforms)
    aCoder.encode(metacritic, forKey: SerializationKeys.metacritic)
    aCoder.encode(rating, forKey: SerializationKeys.rating)
    aCoder.encode(ratingTop, forKey: SerializationKeys.ratingTop)
    aCoder.encode(added, forKey: SerializationKeys.added)
    aCoder.encode(backgroundImage, forKey: SerializationKeys.backgroundImage)
    aCoder.encode(dominantColor, forKey: SerializationKeys.dominantColor)
    aCoder.encode(reviewsTextCount, forKey: SerializationKeys.reviewsTextCount)
  }

}
