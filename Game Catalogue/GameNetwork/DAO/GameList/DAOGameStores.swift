//
//  DAOGameStores.swift
//
//  Created by Amin faruq on 06/07/20
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class DAOGameStores: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let store = "store"
    static let id = "id"
    static let urlEn = "url_en"
  }

  // MARK: Properties
  public var store: DAOGameStore?
  public var id: Int?
  public var urlEn: String?

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
    store = DAOGameStore(json: json[SerializationKeys.store])
    id = json[SerializationKeys.id].int
    urlEn = json[SerializationKeys.urlEn].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = store { dictionary[SerializationKeys.store] = value.dictionaryRepresentation() }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = urlEn { dictionary[SerializationKeys.urlEn] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.store = aDecoder.decodeObject(forKey: SerializationKeys.store) as? DAOGameStore
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? Int
    self.urlEn = aDecoder.decodeObject(forKey: SerializationKeys.urlEn) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(store, forKey: SerializationKeys.store)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(urlEn, forKey: SerializationKeys.urlEn)
  }

}
