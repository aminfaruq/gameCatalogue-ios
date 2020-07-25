//
//  DAODetailDeveloperBaseClass.swift
//
//  Created by Amin faruq on 10/07/20
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class DAODetailDeveloperBaseClass: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let descriptionValue = "description"
    static let name = "name"
    static let id = "id"
    static let imageBackground = "image_background"
    static let slug = "slug"
    static let gamesCount = "games_count"
  }

  // MARK: Properties
  public var descriptionValue: String?
  public var name: String?
  public var id: Int?
  public var imageBackground: String?
  public var slug: String?
  public var gamesCount: Int?

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
    descriptionValue = json[SerializationKeys.descriptionValue].string
    name = json[SerializationKeys.name].string
    id = json[SerializationKeys.id].int
    imageBackground = json[SerializationKeys.imageBackground].string
    slug = json[SerializationKeys.slug].string
    gamesCount = json[SerializationKeys.gamesCount].int
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = descriptionValue { dictionary[SerializationKeys.descriptionValue] = value }
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = imageBackground { dictionary[SerializationKeys.imageBackground] = value }
    if let value = slug { dictionary[SerializationKeys.slug] = value }
    if let value = gamesCount { dictionary[SerializationKeys.gamesCount] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.descriptionValue = aDecoder.decodeObject(forKey: SerializationKeys.descriptionValue) as? String
    self.name = aDecoder.decodeObject(forKey: SerializationKeys.name) as? String
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? Int
    self.imageBackground = aDecoder.decodeObject(forKey: SerializationKeys.imageBackground) as? String
    self.slug = aDecoder.decodeObject(forKey: SerializationKeys.slug) as? String
    self.gamesCount = aDecoder.decodeObject(forKey: SerializationKeys.gamesCount) as? Int
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(descriptionValue, forKey: SerializationKeys.descriptionValue)
    aCoder.encode(name, forKey: SerializationKeys.name)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(imageBackground, forKey: SerializationKeys.imageBackground)
    aCoder.encode(slug, forKey: SerializationKeys.slug)
    aCoder.encode(gamesCount, forKey: SerializationKeys.gamesCount)
  }

}
