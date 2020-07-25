//
//  DAOGameClips.swift
//
//  Created by Amin faruq on 06/07/20
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class DAOGameClips: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let full = "full"
    static let a320 = "320"
    static let a640 = "640"
  }

  // MARK: Properties
  public var full: String?
  public var a320: String?
  public var a640: String?

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
    full = json[SerializationKeys.full].string
    a320 = json[SerializationKeys.a320].string
    a640 = json[SerializationKeys.a640].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = full { dictionary[SerializationKeys.full] = value }
    if let value = a320 { dictionary[SerializationKeys.a320] = value }
    if let value = a640 { dictionary[SerializationKeys.a640] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.full = aDecoder.decodeObject(forKey: SerializationKeys.full) as? String
    self.a320 = aDecoder.decodeObject(forKey: SerializationKeys.a320) as? String
    self.a640 = aDecoder.decodeObject(forKey: SerializationKeys.a640) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(full, forKey: SerializationKeys.full)
    aCoder.encode(a320, forKey: SerializationKeys.a320)
    aCoder.encode(a640, forKey: SerializationKeys.a640)
  }

}
