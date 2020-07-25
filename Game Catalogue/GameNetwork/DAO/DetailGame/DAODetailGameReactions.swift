//
//  DAODetailGameReactions.swift
//
//  Created by Amin faruq on 10/07/20
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class DAODetailGameReactions: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let a12 = "12"
    static let a20 = "20"
    static let a14 = "14"
    static let a16 = "16"
    static let a18 = "18"
    static let a15 = "15"
    static let a2 = "2"
    static let a11 = "11"
    static let a8 = "8"
    static let a1 = "1"
    static let a6 = "6"
    static let a3 = "3"
    static let a4 = "4"
    static let a7 = "7"
    static let a21 = "21"
    static let a10 = "10"
    static let a5 = "5"
  }

  // MARK: Properties
  public var a12: Int?
  public var a20: Int?
  public var a14: Int?
  public var a16: Int?
  public var a18: Int?
  public var a15: Int?
  public var a2: Int?
  public var a11: Int?
  public var a8: Int?
  public var a1: Int?
  public var a6: Int?
  public var a3: Int?
  public var a4: Int?
  public var a7: Int?
  public var a21: Int?
  public var a10: Int?
  public var a5: Int?

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
    a12 = json[SerializationKeys.a12].int
    a20 = json[SerializationKeys.a20].int
    a14 = json[SerializationKeys.a14].int
    a16 = json[SerializationKeys.a16].int
    a18 = json[SerializationKeys.a18].int
    a15 = json[SerializationKeys.a15].int
    a2 = json[SerializationKeys.a2].int
    a11 = json[SerializationKeys.a11].int
    a8 = json[SerializationKeys.a8].int
    a1 = json[SerializationKeys.a1].int
    a6 = json[SerializationKeys.a6].int
    a3 = json[SerializationKeys.a3].int
    a4 = json[SerializationKeys.a4].int
    a7 = json[SerializationKeys.a7].int
    a21 = json[SerializationKeys.a21].int
    a10 = json[SerializationKeys.a10].int
    a5 = json[SerializationKeys.a5].int
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = a12 { dictionary[SerializationKeys.a12] = value }
    if let value = a20 { dictionary[SerializationKeys.a20] = value }
    if let value = a14 { dictionary[SerializationKeys.a14] = value }
    if let value = a16 { dictionary[SerializationKeys.a16] = value }
    if let value = a18 { dictionary[SerializationKeys.a18] = value }
    if let value = a15 { dictionary[SerializationKeys.a15] = value }
    if let value = a2 { dictionary[SerializationKeys.a2] = value }
    if let value = a11 { dictionary[SerializationKeys.a11] = value }
    if let value = a8 { dictionary[SerializationKeys.a8] = value }
    if let value = a1 { dictionary[SerializationKeys.a1] = value }
    if let value = a6 { dictionary[SerializationKeys.a6] = value }
    if let value = a3 { dictionary[SerializationKeys.a3] = value }
    if let value = a4 { dictionary[SerializationKeys.a4] = value }
    if let value = a7 { dictionary[SerializationKeys.a7] = value }
    if let value = a21 { dictionary[SerializationKeys.a21] = value }
    if let value = a10 { dictionary[SerializationKeys.a10] = value }
    if let value = a5 { dictionary[SerializationKeys.a5] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.a12 = aDecoder.decodeObject(forKey: SerializationKeys.a12) as? Int
    self.a20 = aDecoder.decodeObject(forKey: SerializationKeys.a20) as? Int
    self.a14 = aDecoder.decodeObject(forKey: SerializationKeys.a14) as? Int
    self.a16 = aDecoder.decodeObject(forKey: SerializationKeys.a16) as? Int
    self.a18 = aDecoder.decodeObject(forKey: SerializationKeys.a18) as? Int
    self.a15 = aDecoder.decodeObject(forKey: SerializationKeys.a15) as? Int
    self.a2 = aDecoder.decodeObject(forKey: SerializationKeys.a2) as? Int
    self.a11 = aDecoder.decodeObject(forKey: SerializationKeys.a11) as? Int
    self.a8 = aDecoder.decodeObject(forKey: SerializationKeys.a8) as? Int
    self.a1 = aDecoder.decodeObject(forKey: SerializationKeys.a1) as? Int
    self.a6 = aDecoder.decodeObject(forKey: SerializationKeys.a6) as? Int
    self.a3 = aDecoder.decodeObject(forKey: SerializationKeys.a3) as? Int
    self.a4 = aDecoder.decodeObject(forKey: SerializationKeys.a4) as? Int
    self.a7 = aDecoder.decodeObject(forKey: SerializationKeys.a7) as? Int
    self.a21 = aDecoder.decodeObject(forKey: SerializationKeys.a21) as? Int
    self.a10 = aDecoder.decodeObject(forKey: SerializationKeys.a10) as? Int
    self.a5 = aDecoder.decodeObject(forKey: SerializationKeys.a5) as? Int
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(a12, forKey: SerializationKeys.a12)
    aCoder.encode(a20, forKey: SerializationKeys.a20)
    aCoder.encode(a14, forKey: SerializationKeys.a14)
    aCoder.encode(a16, forKey: SerializationKeys.a16)
    aCoder.encode(a18, forKey: SerializationKeys.a18)
    aCoder.encode(a15, forKey: SerializationKeys.a15)
    aCoder.encode(a2, forKey: SerializationKeys.a2)
    aCoder.encode(a11, forKey: SerializationKeys.a11)
    aCoder.encode(a8, forKey: SerializationKeys.a8)
    aCoder.encode(a1, forKey: SerializationKeys.a1)
    aCoder.encode(a6, forKey: SerializationKeys.a6)
    aCoder.encode(a3, forKey: SerializationKeys.a3)
    aCoder.encode(a4, forKey: SerializationKeys.a4)
    aCoder.encode(a7, forKey: SerializationKeys.a7)
    aCoder.encode(a21, forKey: SerializationKeys.a21)
    aCoder.encode(a10, forKey: SerializationKeys.a10)
    aCoder.encode(a5, forKey: SerializationKeys.a5)
  }

}
