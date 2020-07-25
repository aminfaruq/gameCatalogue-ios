//
//  DAODetailGameAddedByStatus.swift
//
//  Created by Amin faruq on 10/07/20
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class DAODetailGameAddedByStatus: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let toplay = "toplay"
    static let playing = "playing"
    static let yet = "yet"
    static let owned = "owned"
    static let beaten = "beaten"
    static let dropped = "dropped"
  }

  // MARK: Properties
  public var toplay: Int?
  public var playing: Int?
  public var yet: Int?
  public var owned: Int?
  public var beaten: Int?
  public var dropped: Int?

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
    toplay = json[SerializationKeys.toplay].int
    playing = json[SerializationKeys.playing].int
    yet = json[SerializationKeys.yet].int
    owned = json[SerializationKeys.owned].int
    beaten = json[SerializationKeys.beaten].int
    dropped = json[SerializationKeys.dropped].int
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = toplay { dictionary[SerializationKeys.toplay] = value }
    if let value = playing { dictionary[SerializationKeys.playing] = value }
    if let value = yet { dictionary[SerializationKeys.yet] = value }
    if let value = owned { dictionary[SerializationKeys.owned] = value }
    if let value = beaten { dictionary[SerializationKeys.beaten] = value }
    if let value = dropped { dictionary[SerializationKeys.dropped] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.toplay = aDecoder.decodeObject(forKey: SerializationKeys.toplay) as? Int
    self.playing = aDecoder.decodeObject(forKey: SerializationKeys.playing) as? Int
    self.yet = aDecoder.decodeObject(forKey: SerializationKeys.yet) as? Int
    self.owned = aDecoder.decodeObject(forKey: SerializationKeys.owned) as? Int
    self.beaten = aDecoder.decodeObject(forKey: SerializationKeys.beaten) as? Int
    self.dropped = aDecoder.decodeObject(forKey: SerializationKeys.dropped) as? Int
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(toplay, forKey: SerializationKeys.toplay)
    aCoder.encode(playing, forKey: SerializationKeys.playing)
    aCoder.encode(yet, forKey: SerializationKeys.yet)
    aCoder.encode(owned, forKey: SerializationKeys.owned)
    aCoder.encode(beaten, forKey: SerializationKeys.beaten)
    aCoder.encode(dropped, forKey: SerializationKeys.dropped)
  }

}
