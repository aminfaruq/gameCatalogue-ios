//
//  DAOGameListBaseClass.swift
//
//  Created by Amin faruq on 06/07/20
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class DAOGameListBaseClass: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let seoDescription = "seo_description"
    static let filters = "filters"
    static let descriptionValue = "description"
    static let next = "next"
    static let noindex = "noindex"
    static let results = "results"
    static let seoTitle = "seo_title"
    static let nofollowCollections = "nofollow_collections"
    static let count = "count"
    static let seoKeywords = "seo_keywords"
    static let nofollow = "nofollow"
    static let seoH1 = "seo_h1"
  }

  // MARK: Properties
  public var seoDescription: String?
  public var filters: DAOGameFilters?
  public var descriptionValue: String?
  public var next: String?
  public var noindex: Bool? = false
  public var results: [DAOGameResults]?
  public var seoTitle: String?
  public var nofollowCollections: [String]?
  public var count: Int?
  public var seoKeywords: String?
  public var nofollow: Bool? = false
  public var seoH1: String?

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
    seoDescription = json[SerializationKeys.seoDescription].string
    filters = DAOGameFilters(json: json[SerializationKeys.filters])
    descriptionValue = json[SerializationKeys.descriptionValue].string
    next = json[SerializationKeys.next].string
    noindex = json[SerializationKeys.noindex].boolValue
    if let items = json[SerializationKeys.results].array { results = items.map { DAOGameResults(json: $0) } }
    seoTitle = json[SerializationKeys.seoTitle].string
    if let items = json[SerializationKeys.nofollowCollections].array { nofollowCollections = items.map { $0.stringValue } }
    count = json[SerializationKeys.count].int
    seoKeywords = json[SerializationKeys.seoKeywords].string
    nofollow = json[SerializationKeys.nofollow].boolValue
    seoH1 = json[SerializationKeys.seoH1].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = seoDescription { dictionary[SerializationKeys.seoDescription] = value }
    if let value = filters { dictionary[SerializationKeys.filters] = value.dictionaryRepresentation() }
    if let value = descriptionValue { dictionary[SerializationKeys.descriptionValue] = value }
    if let value = next { dictionary[SerializationKeys.next] = value }
    dictionary[SerializationKeys.noindex] = noindex
    if let value = results { dictionary[SerializationKeys.results] = value.map { $0.dictionaryRepresentation() } }
    if let value = seoTitle { dictionary[SerializationKeys.seoTitle] = value }
    if let value = nofollowCollections { dictionary[SerializationKeys.nofollowCollections] = value }
    if let value = count { dictionary[SerializationKeys.count] = value }
    if let value = seoKeywords { dictionary[SerializationKeys.seoKeywords] = value }
    dictionary[SerializationKeys.nofollow] = nofollow
    if let value = seoH1 { dictionary[SerializationKeys.seoH1] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.seoDescription = aDecoder.decodeObject(forKey: SerializationKeys.seoDescription) as? String
    self.filters = aDecoder.decodeObject(forKey: SerializationKeys.filters) as? DAOGameFilters
    self.descriptionValue = aDecoder.decodeObject(forKey: SerializationKeys.descriptionValue) as? String
    self.next = aDecoder.decodeObject(forKey: SerializationKeys.next) as? String
    self.noindex = aDecoder.decodeBool(forKey: SerializationKeys.noindex)
    self.results = aDecoder.decodeObject(forKey: SerializationKeys.results) as? [DAOGameResults]
    self.seoTitle = aDecoder.decodeObject(forKey: SerializationKeys.seoTitle) as? String
    self.nofollowCollections = aDecoder.decodeObject(forKey: SerializationKeys.nofollowCollections) as? [String]
    self.count = aDecoder.decodeObject(forKey: SerializationKeys.count) as? Int
    self.seoKeywords = aDecoder.decodeObject(forKey: SerializationKeys.seoKeywords) as? String
    self.nofollow = aDecoder.decodeBool(forKey: SerializationKeys.nofollow)
    self.seoH1 = aDecoder.decodeObject(forKey: SerializationKeys.seoH1) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(seoDescription, forKey: SerializationKeys.seoDescription)
    aCoder.encode(filters, forKey: SerializationKeys.filters)
    aCoder.encode(descriptionValue, forKey: SerializationKeys.descriptionValue)
    aCoder.encode(next, forKey: SerializationKeys.next)
    aCoder.encode(noindex, forKey: SerializationKeys.noindex)
    aCoder.encode(results, forKey: SerializationKeys.results)
    aCoder.encode(seoTitle, forKey: SerializationKeys.seoTitle)
    aCoder.encode(nofollowCollections, forKey: SerializationKeys.nofollowCollections)
    aCoder.encode(count, forKey: SerializationKeys.count)
    aCoder.encode(seoKeywords, forKey: SerializationKeys.seoKeywords)
    aCoder.encode(nofollow, forKey: SerializationKeys.nofollow)
    aCoder.encode(seoH1, forKey: SerializationKeys.seoH1)
  }

}
