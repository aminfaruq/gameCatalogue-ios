//
//  DAOGameRatings.swift
//
//  Created by Amin faruq on 06/07/20
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class DAOGameRatings: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let title = "title"
    static let percent = "percent"
    static let id = "id"
    static let count = "count"
  }

  // MARK: Properties
  public var title: String?
  public var percent: Float?
  public var id: Int?
  public var count: Int?

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
    title = json[SerializationKeys.title].string
    percent = json[SerializationKeys.percent].float
    id = json[SerializationKeys.id].int
    count = json[SerializationKeys.count].int
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = title { dictionary[SerializationKeys.title] = value }
    if let value = percent { dictionary[SerializationKeys.percent] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = count { dictionary[SerializationKeys.count] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.title = aDecoder.decodeObject(forKey: SerializationKeys.title) as? String
    self.percent = aDecoder.decodeObject(forKey: SerializationKeys.percent) as? Float
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? Int
    self.count = aDecoder.decodeObject(forKey: SerializationKeys.count) as? Int
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(title, forKey: SerializationKeys.title)
    aCoder.encode(percent, forKey: SerializationKeys.percent)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(count, forKey: SerializationKeys.count)
  }

}
