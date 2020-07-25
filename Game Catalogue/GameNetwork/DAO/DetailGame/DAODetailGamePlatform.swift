//
//  DAODetailGamePlatform.swift
//
//  Created by Amin faruq on 10/07/20
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class DAODetailGamePlatform: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let slug = "slug"
    static let platform = "platform"
    static let name = "name"
  }

  // MARK: Properties
  public var slug: String?
  public var platform: Int?
  public var name: String?

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
    slug = json[SerializationKeys.slug].string
    platform = json[SerializationKeys.platform].int
    name = json[SerializationKeys.name].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = slug { dictionary[SerializationKeys.slug] = value }
    if let value = platform { dictionary[SerializationKeys.platform] = value }
    if let value = name { dictionary[SerializationKeys.name] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.slug = aDecoder.decodeObject(forKey: SerializationKeys.slug) as? String
    self.platform = aDecoder.decodeObject(forKey: SerializationKeys.platform) as? Int
    self.name = aDecoder.decodeObject(forKey: SerializationKeys.name) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(slug, forKey: SerializationKeys.slug)
    aCoder.encode(platform, forKey: SerializationKeys.platform)
    aCoder.encode(name, forKey: SerializationKeys.name)
  }

}
