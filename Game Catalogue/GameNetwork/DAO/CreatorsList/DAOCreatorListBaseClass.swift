//
//  DAOCreatorListBaseClass.swift
//
//  Created by Amin faruq on 09/07/20
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class DAOCreatorListBaseClass: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let next = "next"
    static let results = "results"
    static let count = "count"
  }

  // MARK: Properties
  public var next: String?
  public var results: [DAOCreatorResults]?
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
    next = json[SerializationKeys.next].string
    if let items = json[SerializationKeys.results].array { results = items.map { DAOCreatorResults(json: $0) } }
    count = json[SerializationKeys.count].int
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = next { dictionary[SerializationKeys.next] = value }
    if let value = results { dictionary[SerializationKeys.results] = value.map { $0.dictionaryRepresentation() } }
    if let value = count { dictionary[SerializationKeys.count] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.next = aDecoder.decodeObject(forKey: SerializationKeys.next) as? String
    self.results = aDecoder.decodeObject(forKey: SerializationKeys.results) as? [DAOCreatorResults]
    self.count = aDecoder.decodeObject(forKey: SerializationKeys.count) as? Int
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(next, forKey: SerializationKeys.next)
    aCoder.encode(results, forKey: SerializationKeys.results)
    aCoder.encode(count, forKey: SerializationKeys.count)
  }

}
