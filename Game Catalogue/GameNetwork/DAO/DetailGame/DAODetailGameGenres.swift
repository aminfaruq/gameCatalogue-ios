//
//  DAODetailGameGenres.swift
//
//  Created by Amin faruq on 10/07/20
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class DAODetailGameGenres: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let name = "name"
    static let id = "id"
    static let slug = "slug"
    static let gamesCount = "games_count"
    static let imageBackground = "image_background"
  }

  // MARK: Properties
  public var name: String?
  public var id: Int?
  public var slug: String?
  public var gamesCount: Int?
  public var imageBackground: String?

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
    name = json[SerializationKeys.name].string
    id = json[SerializationKeys.id].int
    slug = json[SerializationKeys.slug].string
    gamesCount = json[SerializationKeys.gamesCount].int
    imageBackground = json[SerializationKeys.imageBackground].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = slug { dictionary[SerializationKeys.slug] = value }
    if let value = gamesCount { dictionary[SerializationKeys.gamesCount] = value }
    if let value = imageBackground { dictionary[SerializationKeys.imageBackground] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.name = aDecoder.decodeObject(forKey: SerializationKeys.name) as? String
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? Int
    self.slug = aDecoder.decodeObject(forKey: SerializationKeys.slug) as? String
    self.gamesCount = aDecoder.decodeObject(forKey: SerializationKeys.gamesCount) as? Int
    self.imageBackground = aDecoder.decodeObject(forKey: SerializationKeys.imageBackground) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(name, forKey: SerializationKeys.name)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(slug, forKey: SerializationKeys.slug)
    aCoder.encode(gamesCount, forKey: SerializationKeys.gamesCount)
    aCoder.encode(imageBackground, forKey: SerializationKeys.imageBackground)
  }

}
