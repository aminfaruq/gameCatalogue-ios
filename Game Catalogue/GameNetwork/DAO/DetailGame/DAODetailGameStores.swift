//
//  DAODetailGameStores.swift
//
//  Created by Amin faruq on 10/07/20
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class DAODetailGameStores: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let id = "id"
    static let url = "url"
    static let store = "store"
  }

  // MARK: Properties
  public var id: Int?
  public var url: String?
  public var store: DAODetailGameStore?

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
    id = json[SerializationKeys.id].int
    url = json[SerializationKeys.url].string
    store = DAODetailGameStore(json: json[SerializationKeys.store])
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = url { dictionary[SerializationKeys.url] = value }
    if let value = store { dictionary[SerializationKeys.store] = value.dictionaryRepresentation() }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? Int
    self.url = aDecoder.decodeObject(forKey: SerializationKeys.url) as? String
    self.store = aDecoder.decodeObject(forKey: SerializationKeys.store) as? DAODetailGameStore
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(url, forKey: SerializationKeys.url)
    aCoder.encode(store, forKey: SerializationKeys.store)
  }

}