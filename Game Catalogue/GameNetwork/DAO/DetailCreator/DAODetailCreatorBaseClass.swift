//
//  DAODetailCreatorBaseClass.swift
//
//  Created by Amin faruq on 10/07/20
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class DAODetailCreatorBaseClass: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let reviewsCount = "reviews_count"
    static let timeline = "timeline"
    static let name = "name"
    static let descriptionValue = "description"
    static let platforms = "platforms"
    static let positions = "positions"
    static let rating = "rating"
    static let ratingTop = "rating_top"
    static let updated = "updated"
    static let id = "id"
    static let imageBackground = "image_background"
    static let gamesCount = "games_count"
    static let ratings = "ratings"
    static let image = "image"
    static let slug = "slug"
  }

  // MARK: Properties
  public var reviewsCount: Int?
  public var timeline: [DAODetailCreatorTimeline]?
  public var name: String?
  public var descriptionValue: String?
  public var platforms: DAODetailCreatorPlatforms?
  public var positions: [DAODetailCreatorPositions]?
  public var rating: String?
  public var ratingTop: Int?
  public var updated: String?
  public var id: Int?
  public var imageBackground: String?
  public var gamesCount: Int?
  public var ratings: [DAODetailCreatorRatings]?
  public var image: String?
  public var slug: String?

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
    if let items = json[SerializationKeys.timeline].array { timeline = items.map { DAODetailCreatorTimeline(json: $0) } }
    name = json[SerializationKeys.name].string
    descriptionValue = json[SerializationKeys.descriptionValue].string
    platforms = DAODetailCreatorPlatforms(json: json[SerializationKeys.platforms])
    if let items = json[SerializationKeys.positions].array { positions = items.map { DAODetailCreatorPositions(json: $0) } }
    rating = json[SerializationKeys.rating].string
    ratingTop = json[SerializationKeys.ratingTop].int
    updated = json[SerializationKeys.updated].string
    id = json[SerializationKeys.id].int
    imageBackground = json[SerializationKeys.imageBackground].string
    gamesCount = json[SerializationKeys.gamesCount].int
    if let items = json[SerializationKeys.ratings].array { ratings = items.map { DAODetailCreatorRatings(json: $0) } }
    image = json[SerializationKeys.image].string
    slug = json[SerializationKeys.slug].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = reviewsCount { dictionary[SerializationKeys.reviewsCount] = value }
    if let value = timeline { dictionary[SerializationKeys.timeline] = value.map { $0.dictionaryRepresentation() } }
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = descriptionValue { dictionary[SerializationKeys.descriptionValue] = value }
    if let value = platforms { dictionary[SerializationKeys.platforms] = value.dictionaryRepresentation() }
    if let value = positions { dictionary[SerializationKeys.positions] = value.map { $0.dictionaryRepresentation() } }
    if let value = rating { dictionary[SerializationKeys.rating] = value }
    if let value = ratingTop { dictionary[SerializationKeys.ratingTop] = value }
    if let value = updated { dictionary[SerializationKeys.updated] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = imageBackground { dictionary[SerializationKeys.imageBackground] = value }
    if let value = gamesCount { dictionary[SerializationKeys.gamesCount] = value }
    if let value = ratings { dictionary[SerializationKeys.ratings] = value.map { $0.dictionaryRepresentation() } }
    if let value = image { dictionary[SerializationKeys.image] = value }
    if let value = slug { dictionary[SerializationKeys.slug] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.reviewsCount = aDecoder.decodeObject(forKey: SerializationKeys.reviewsCount) as? Int
    self.timeline = aDecoder.decodeObject(forKey: SerializationKeys.timeline) as? [DAODetailCreatorTimeline]
    self.name = aDecoder.decodeObject(forKey: SerializationKeys.name) as? String
    self.descriptionValue = aDecoder.decodeObject(forKey: SerializationKeys.descriptionValue) as? String
    self.platforms = aDecoder.decodeObject(forKey: SerializationKeys.platforms) as? DAODetailCreatorPlatforms
    self.positions = aDecoder.decodeObject(forKey: SerializationKeys.positions) as? [DAODetailCreatorPositions]
    self.rating = aDecoder.decodeObject(forKey: SerializationKeys.rating) as? String
    self.ratingTop = aDecoder.decodeObject(forKey: SerializationKeys.ratingTop) as? Int
    self.updated = aDecoder.decodeObject(forKey: SerializationKeys.updated) as? String
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? Int
    self.imageBackground = aDecoder.decodeObject(forKey: SerializationKeys.imageBackground) as? String
    self.gamesCount = aDecoder.decodeObject(forKey: SerializationKeys.gamesCount) as? Int
    self.ratings = aDecoder.decodeObject(forKey: SerializationKeys.ratings) as? [DAODetailCreatorRatings]
    self.image = aDecoder.decodeObject(forKey: SerializationKeys.image) as? String
    self.slug = aDecoder.decodeObject(forKey: SerializationKeys.slug) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(reviewsCount, forKey: SerializationKeys.reviewsCount)
    aCoder.encode(timeline, forKey: SerializationKeys.timeline)
    aCoder.encode(name, forKey: SerializationKeys.name)
    aCoder.encode(descriptionValue, forKey: SerializationKeys.descriptionValue)
    aCoder.encode(platforms, forKey: SerializationKeys.platforms)
    aCoder.encode(positions, forKey: SerializationKeys.positions)
    aCoder.encode(rating, forKey: SerializationKeys.rating)
    aCoder.encode(ratingTop, forKey: SerializationKeys.ratingTop)
    aCoder.encode(updated, forKey: SerializationKeys.updated)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(imageBackground, forKey: SerializationKeys.imageBackground)
    aCoder.encode(gamesCount, forKey: SerializationKeys.gamesCount)
    aCoder.encode(ratings, forKey: SerializationKeys.ratings)
    aCoder.encode(image, forKey: SerializationKeys.image)
    aCoder.encode(slug, forKey: SerializationKeys.slug)
  }

}
