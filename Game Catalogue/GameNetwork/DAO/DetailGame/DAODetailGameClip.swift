//
//  DAODetailGameClip.swift
//
//  Created by Amin faruq on 10/07/20
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class DAODetailGameClip: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let clips = "clips"
    static let video = "video"
    static let preview = "preview"
    static let clip = "clip"
  }

  // MARK: Properties
  public var clips: DAODetailGameClips?
  public var video: String?
  public var preview: String?
  public var clip: String?

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
    clips = DAODetailGameClips(json: json[SerializationKeys.clips])
    video = json[SerializationKeys.video].string
    preview = json[SerializationKeys.preview].string
    clip = json[SerializationKeys.clip].string
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = clips { dictionary[SerializationKeys.clips] = value.dictionaryRepresentation() }
    if let value = video { dictionary[SerializationKeys.video] = value }
    if let value = preview { dictionary[SerializationKeys.preview] = value }
    if let value = clip { dictionary[SerializationKeys.clip] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.clips = aDecoder.decodeObject(forKey: SerializationKeys.clips) as? DAODetailGameClips
    self.video = aDecoder.decodeObject(forKey: SerializationKeys.video) as? String
    self.preview = aDecoder.decodeObject(forKey: SerializationKeys.preview) as? String
    self.clip = aDecoder.decodeObject(forKey: SerializationKeys.clip) as? String
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(clips, forKey: SerializationKeys.clips)
    aCoder.encode(video, forKey: SerializationKeys.video)
    aCoder.encode(preview, forKey: SerializationKeys.preview)
    aCoder.encode(clip, forKey: SerializationKeys.clip)
  }

}
