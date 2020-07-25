//
//  DAODetailGamePlatforms.swift
//
//  Created by Amin faruq on 10/07/20
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class DAODetailGamePlatforms: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let platform = "platform"
    static let releasedAt = "released_at"
  }

  // MARK: Properties
  public var platform: DAODetailGamePlatform?
  public var releasedAt: String?

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
    platform = DAODetailGamePlatform(json: json[SerializationKeys.platform])
    releasedAt = json[SerializationKeys.releasedAt].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = platform { dictionary[SerializationKeys.platform] = value.dictionaryRepresentation() }
    if let value = releasedAt { dictionary[SerializationKeys.releasedAt] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.platform = aDecoder.decodeObject(forKey: SerializationKeys.platform) as? DAODetailGamePlatform
    self.releasedAt = aDecoder.decodeObject(forKey: SerializationKeys.releasedAt) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(platform, forKey: SerializationKeys.platform)
    aCoder.encode(releasedAt, forKey: SerializationKeys.releasedAt)
  }

}
