//
//  DAODetailGameMetacriticPlatforms.swift
//
//  Created by Amin faruq on 10/07/20
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class DAODetailGameMetacriticPlatforms: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let metascore = "metascore"
    static let platform = "platform"
    static let url = "url"
  }

  // MARK: Properties
  public var metascore: Int?
  public var platform: DAODetailGamePlatform?
  public var url: String?

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
    metascore = json[SerializationKeys.metascore].int
    platform = DAODetailGamePlatform(json: json[SerializationKeys.platform])
    url = json[SerializationKeys.url].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = metascore { dictionary[SerializationKeys.metascore] = value }
    if let value = platform { dictionary[SerializationKeys.platform] = value.dictionaryRepresentation() }
    if let value = url { dictionary[SerializationKeys.url] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.metascore = aDecoder.decodeObject(forKey: SerializationKeys.metascore) as? Int
    self.platform = aDecoder.decodeObject(forKey: SerializationKeys.platform) as? DAODetailGamePlatform
    self.url = aDecoder.decodeObject(forKey: SerializationKeys.url) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(metascore, forKey: SerializationKeys.metascore)
    aCoder.encode(platform, forKey: SerializationKeys.platform)
    aCoder.encode(url, forKey: SerializationKeys.url)
  }

}
