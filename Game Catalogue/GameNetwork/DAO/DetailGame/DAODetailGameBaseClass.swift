//
//  DAODetailGameBaseClass.swift
//
//  Created by Amin faruq on 10/07/20
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class DAODetailGameBaseClass: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let suggestionsCount = "suggestions_count"
    static let addedByStatus = "added_by_status"
    static let backgroundImageAdditional = "background_image_additional"
    static let tags = "tags"
    static let updated = "updated"
    static let parentPlatforms = "parent_platforms"
    static let creatorsCount = "creators_count"
    static let id = "id"
    static let youtubeCount = "youtube_count"
    static let released = "released"
    static let twitchCount = "twitch_count"
    static let developers = "developers"
    static let screenshotsCount = "screenshots_count"
    static let redditDescription = "reddit_description"
    static let website = "website"
    static let descriptionValue = "description"
    static let parentAchievementsCount = "parent_achievements_count"
    static let platforms = "platforms"
    static let rating = "rating"
    static let stores = "stores"
    static let ratingTop = "rating_top"
    static let added = "added"
    static let esrbRating = "esrb_rating"
    static let redditUrl = "reddit_url"
    static let gameSeriesCount = "game_series_count"
    static let achievementsCount = "achievements_count"
    static let alternativeNames = "alternative_names"
    static let dominantColor = "dominant_color"
    static let reviewsCount = "reviews_count"
    static let ratingsCount = "ratings_count"
    static let tba = "tba"
    static let reactions = "reactions"
    static let parentsCount = "parents_count"
    static let metacriticPlatforms = "metacritic_platforms"
    static let slug = "slug"
    static let ratings = "ratings"
    static let clip = "clip"
    static let additionsCount = "additions_count"
    static let saturatedColor = "saturated_color"
    static let publishers = "publishers"
    static let name = "name"
    static let metacriticUrl = "metacritic_url"
    static let playtime = "playtime"
    static let genres = "genres"
    static let nameOriginal = "name_original"
    static let metacritic = "metacritic"
    static let redditCount = "reddit_count"
    static let redditLogo = "reddit_logo"
    static let backgroundImage = "background_image"
    static let redditName = "reddit_name"
    static let moviesCount = "movies_count"
    static let descriptionRaw = "description_raw"
    static let reviewsTextCount = "reviews_text_count"
  }

  // MARK: Properties
  public var suggestionsCount: Int?
  public var addedByStatus: DAODetailGameAddedByStatus?
  public var backgroundImageAdditional: String?
  public var tags: [DAODetailGameTags]?
  public var updated: String?
  public var parentPlatforms: [DAODetailGameParentPlatforms]?
  public var creatorsCount: Int?
  public var id: Int?
  public var youtubeCount: Int?
  public var released: String?
  public var twitchCount: Int?
  public var developers: [DAODetailGameDevelopers]?
  public var screenshotsCount: Int?
  public var redditDescription: String?
  public var website: String?
  public var descriptionValue: String?
  public var parentAchievementsCount: Int?
  public var platforms: [DAODetailGamePlatforms]?
  public var rating: Float?
  public var stores: [DAODetailGameStores]?
  public var ratingTop: Int?
  public var added: Int?
  public var esrbRating: DAODetailGameEsrbRating?
  public var redditUrl: String?
  public var gameSeriesCount: Int?
  public var achievementsCount: Int?
  public var alternativeNames: [String]?
  public var dominantColor: String?
  public var reviewsCount: Int?
  public var ratingsCount: Int?
  public var tba: Bool? = false
  public var reactions: DAODetailGameReactions?
  public var parentsCount: Int?
  public var metacriticPlatforms: [DAODetailGameMetacriticPlatforms]?
  public var slug: String?
  public var ratings: [DAODetailGameRatings]?
  public var clip: DAODetailGameClip?
  public var additionsCount: Int?
  public var saturatedColor: String?
  public var publishers: [DAODetailGamePublishers]?
  public var name: String?
  public var metacriticUrl: String?
  public var playtime: Int?
  public var genres: [DAODetailGameGenres]?
  public var nameOriginal: String?
  public var metacritic: Int?
  public var redditCount: Int?
  public var redditLogo: String?
  public var backgroundImage: String?
  public var redditName: String?
  public var moviesCount: Int?
  public var descriptionRaw: String?
  public var reviewsTextCount: Int?

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
    suggestionsCount = json[SerializationKeys.suggestionsCount].int
    addedByStatus = DAODetailGameAddedByStatus(json: json[SerializationKeys.addedByStatus])
    backgroundImageAdditional = json[SerializationKeys.backgroundImageAdditional].string
    if let items = json[SerializationKeys.tags].array { tags = items.map { DAODetailGameTags(json: $0) } }
    updated = json[SerializationKeys.updated].string
    if let items = json[SerializationKeys.parentPlatforms].array { parentPlatforms = items.map { DAODetailGameParentPlatforms(json: $0) } }
    creatorsCount = json[SerializationKeys.creatorsCount].int
    id = json[SerializationKeys.id].int
    youtubeCount = json[SerializationKeys.youtubeCount].int
    released = json[SerializationKeys.released].string
    twitchCount = json[SerializationKeys.twitchCount].int
    if let items = json[SerializationKeys.developers].array { developers = items.map { DAODetailGameDevelopers(json: $0) } }
    screenshotsCount = json[SerializationKeys.screenshotsCount].int
    redditDescription = json[SerializationKeys.redditDescription].string
    website = json[SerializationKeys.website].string
    descriptionValue = json[SerializationKeys.descriptionValue].string
    parentAchievementsCount = json[SerializationKeys.parentAchievementsCount].int
    if let items = json[SerializationKeys.platforms].array { platforms = items.map { DAODetailGamePlatforms(json: $0) } }
    rating = json[SerializationKeys.rating].float
    if let items = json[SerializationKeys.stores].array { stores = items.map { DAODetailGameStores(json: $0) } }
    ratingTop = json[SerializationKeys.ratingTop].int
    added = json[SerializationKeys.added].int
    esrbRating = DAODetailGameEsrbRating(json: json[SerializationKeys.esrbRating])
    redditUrl = json[SerializationKeys.redditUrl].string
    gameSeriesCount = json[SerializationKeys.gameSeriesCount].int
    achievementsCount = json[SerializationKeys.achievementsCount].int
    if let items = json[SerializationKeys.alternativeNames].array { alternativeNames = items.map { $0.stringValue } }
    dominantColor = json[SerializationKeys.dominantColor].string
    reviewsCount = json[SerializationKeys.reviewsCount].int
    ratingsCount = json[SerializationKeys.ratingsCount].int
    tba = json[SerializationKeys.tba].boolValue
    reactions = DAODetailGameReactions(json: json[SerializationKeys.reactions])
    parentsCount = json[SerializationKeys.parentsCount].int
    if let items = json[SerializationKeys.metacriticPlatforms].array { metacriticPlatforms = items.map { DAODetailGameMetacriticPlatforms(json: $0) } }
    slug = json[SerializationKeys.slug].string
    if let items = json[SerializationKeys.ratings].array { ratings = items.map { DAODetailGameRatings(json: $0) } }
    clip = DAODetailGameClip(json: json[SerializationKeys.clip])
    additionsCount = json[SerializationKeys.additionsCount].int
    saturatedColor = json[SerializationKeys.saturatedColor].string
    if let items = json[SerializationKeys.publishers].array { publishers = items.map { DAODetailGamePublishers(json: $0) } }
    name = json[SerializationKeys.name].string
    metacriticUrl = json[SerializationKeys.metacriticUrl].string
    playtime = json[SerializationKeys.playtime].int
    if let items = json[SerializationKeys.genres].array { genres = items.map { DAODetailGameGenres(json: $0) } }
    nameOriginal = json[SerializationKeys.nameOriginal].string
    metacritic = json[SerializationKeys.metacritic].int
    redditCount = json[SerializationKeys.redditCount].int
    redditLogo = json[SerializationKeys.redditLogo].string
    backgroundImage = json[SerializationKeys.backgroundImage].string
    redditName = json[SerializationKeys.redditName].string
    moviesCount = json[SerializationKeys.moviesCount].int
    descriptionRaw = json[SerializationKeys.descriptionRaw].string
    reviewsTextCount = json[SerializationKeys.reviewsTextCount].int
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = suggestionsCount { dictionary[SerializationKeys.suggestionsCount] = value }
    if let value = addedByStatus { dictionary[SerializationKeys.addedByStatus] = value.dictionaryRepresentation() }
    if let value = backgroundImageAdditional { dictionary[SerializationKeys.backgroundImageAdditional] = value }
    if let value = tags { dictionary[SerializationKeys.tags] = value.map { $0.dictionaryRepresentation() } }
    if let value = updated { dictionary[SerializationKeys.updated] = value }
    if let value = parentPlatforms { dictionary[SerializationKeys.parentPlatforms] = value.map { $0.dictionaryRepresentation() } }
    if let value = creatorsCount { dictionary[SerializationKeys.creatorsCount] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = youtubeCount { dictionary[SerializationKeys.youtubeCount] = value }
    if let value = released { dictionary[SerializationKeys.released] = value }
    if let value = twitchCount { dictionary[SerializationKeys.twitchCount] = value }
    if let value = developers { dictionary[SerializationKeys.developers] = value.map { $0.dictionaryRepresentation() } }
    if let value = screenshotsCount { dictionary[SerializationKeys.screenshotsCount] = value }
    if let value = redditDescription { dictionary[SerializationKeys.redditDescription] = value }
    if let value = website { dictionary[SerializationKeys.website] = value }
    if let value = descriptionValue { dictionary[SerializationKeys.descriptionValue] = value }
    if let value = parentAchievementsCount { dictionary[SerializationKeys.parentAchievementsCount] = value }
    if let value = platforms { dictionary[SerializationKeys.platforms] = value.map { $0.dictionaryRepresentation() } }
    if let value = rating { dictionary[SerializationKeys.rating] = value }
    if let value = stores { dictionary[SerializationKeys.stores] = value.map { $0.dictionaryRepresentation() } }
    if let value = ratingTop { dictionary[SerializationKeys.ratingTop] = value }
    if let value = added { dictionary[SerializationKeys.added] = value }
    if let value = esrbRating { dictionary[SerializationKeys.esrbRating] = value.dictionaryRepresentation() }
    if let value = redditUrl { dictionary[SerializationKeys.redditUrl] = value }
    if let value = gameSeriesCount { dictionary[SerializationKeys.gameSeriesCount] = value }
    if let value = achievementsCount { dictionary[SerializationKeys.achievementsCount] = value }
    if let value = alternativeNames { dictionary[SerializationKeys.alternativeNames] = value }
    if let value = dominantColor { dictionary[SerializationKeys.dominantColor] = value }
    if let value = reviewsCount { dictionary[SerializationKeys.reviewsCount] = value }
    if let value = ratingsCount { dictionary[SerializationKeys.ratingsCount] = value }
    dictionary[SerializationKeys.tba] = tba
    if let value = reactions { dictionary[SerializationKeys.reactions] = value.dictionaryRepresentation() }
    if let value = parentsCount { dictionary[SerializationKeys.parentsCount] = value }
    if let value = metacriticPlatforms { dictionary[SerializationKeys.metacriticPlatforms] = value.map { $0.dictionaryRepresentation() } }
    if let value = slug { dictionary[SerializationKeys.slug] = value }
    if let value = ratings { dictionary[SerializationKeys.ratings] = value.map { $0.dictionaryRepresentation() } }
    if let value = clip { dictionary[SerializationKeys.clip] = value.dictionaryRepresentation() }
    if let value = additionsCount { dictionary[SerializationKeys.additionsCount] = value }
    if let value = saturatedColor { dictionary[SerializationKeys.saturatedColor] = value }
    if let value = publishers { dictionary[SerializationKeys.publishers] = value.map { $0.dictionaryRepresentation() } }
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = metacriticUrl { dictionary[SerializationKeys.metacriticUrl] = value }
    if let value = playtime { dictionary[SerializationKeys.playtime] = value }
    if let value = genres { dictionary[SerializationKeys.genres] = value.map { $0.dictionaryRepresentation() } }
    if let value = nameOriginal { dictionary[SerializationKeys.nameOriginal] = value }
    if let value = metacritic { dictionary[SerializationKeys.metacritic] = value }
    if let value = redditCount { dictionary[SerializationKeys.redditCount] = value }
    if let value = redditLogo { dictionary[SerializationKeys.redditLogo] = value }
    if let value = backgroundImage { dictionary[SerializationKeys.backgroundImage] = value }
    if let value = redditName { dictionary[SerializationKeys.redditName] = value }
    if let value = moviesCount { dictionary[SerializationKeys.moviesCount] = value }
    if let value = descriptionRaw { dictionary[SerializationKeys.descriptionRaw] = value }
    if let value = reviewsTextCount { dictionary[SerializationKeys.reviewsTextCount] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.suggestionsCount = aDecoder.decodeObject(forKey: SerializationKeys.suggestionsCount) as? Int
    self.addedByStatus = aDecoder.decodeObject(forKey: SerializationKeys.addedByStatus) as? DAODetailGameAddedByStatus
    self.backgroundImageAdditional = aDecoder.decodeObject(forKey: SerializationKeys.backgroundImageAdditional) as? String
    self.tags = aDecoder.decodeObject(forKey: SerializationKeys.tags) as? [DAODetailGameTags]
    self.updated = aDecoder.decodeObject(forKey: SerializationKeys.updated) as? String
    self.parentPlatforms = aDecoder.decodeObject(forKey: SerializationKeys.parentPlatforms) as? [DAODetailGameParentPlatforms]
    self.creatorsCount = aDecoder.decodeObject(forKey: SerializationKeys.creatorsCount) as? Int
    self.id = aDecoder.decodeObject(forKey: SerializationKeys.id) as? Int
    self.youtubeCount = aDecoder.decodeObject(forKey: SerializationKeys.youtubeCount) as? Int
    self.released = aDecoder.decodeObject(forKey: SerializationKeys.released) as? String
    self.twitchCount = aDecoder.decodeObject(forKey: SerializationKeys.twitchCount) as? Int
    self.developers = aDecoder.decodeObject(forKey: SerializationKeys.developers) as? [DAODetailGameDevelopers]
    self.screenshotsCount = aDecoder.decodeObject(forKey: SerializationKeys.screenshotsCount) as? Int
    self.redditDescription = aDecoder.decodeObject(forKey: SerializationKeys.redditDescription) as? String
    self.website = aDecoder.decodeObject(forKey: SerializationKeys.website) as? String
    self.descriptionValue = aDecoder.decodeObject(forKey: SerializationKeys.descriptionValue) as? String
    self.parentAchievementsCount = aDecoder.decodeObject(forKey: SerializationKeys.parentAchievementsCount) as? Int
    self.platforms = aDecoder.decodeObject(forKey: SerializationKeys.platforms) as? [DAODetailGamePlatforms]
    self.rating = aDecoder.decodeObject(forKey: SerializationKeys.rating) as? Float
    self.stores = aDecoder.decodeObject(forKey: SerializationKeys.stores) as? [DAODetailGameStores]
    self.ratingTop = aDecoder.decodeObject(forKey: SerializationKeys.ratingTop) as? Int
    self.added = aDecoder.decodeObject(forKey: SerializationKeys.added) as? Int
    self.esrbRating = aDecoder.decodeObject(forKey: SerializationKeys.esrbRating) as? DAODetailGameEsrbRating
    self.redditUrl = aDecoder.decodeObject(forKey: SerializationKeys.redditUrl) as? String
    self.gameSeriesCount = aDecoder.decodeObject(forKey: SerializationKeys.gameSeriesCount) as? Int
    self.achievementsCount = aDecoder.decodeObject(forKey: SerializationKeys.achievementsCount) as? Int
    self.alternativeNames = aDecoder.decodeObject(forKey: SerializationKeys.alternativeNames) as? [String]
    self.dominantColor = aDecoder.decodeObject(forKey: SerializationKeys.dominantColor) as? String
    self.reviewsCount = aDecoder.decodeObject(forKey: SerializationKeys.reviewsCount) as? Int
    self.ratingsCount = aDecoder.decodeObject(forKey: SerializationKeys.ratingsCount) as? Int
    self.tba = aDecoder.decodeBool(forKey: SerializationKeys.tba)
    self.reactions = aDecoder.decodeObject(forKey: SerializationKeys.reactions) as? DAODetailGameReactions
    self.parentsCount = aDecoder.decodeObject(forKey: SerializationKeys.parentsCount) as? Int
    self.metacriticPlatforms = aDecoder.decodeObject(forKey: SerializationKeys.metacriticPlatforms) as? [DAODetailGameMetacriticPlatforms]
    self.slug = aDecoder.decodeObject(forKey: SerializationKeys.slug) as? String
    self.ratings = aDecoder.decodeObject(forKey: SerializationKeys.ratings) as? [DAODetailGameRatings]
    self.clip = aDecoder.decodeObject(forKey: SerializationKeys.clip) as? DAODetailGameClip
    self.additionsCount = aDecoder.decodeObject(forKey: SerializationKeys.additionsCount) as? Int
    self.saturatedColor = aDecoder.decodeObject(forKey: SerializationKeys.saturatedColor) as? String
    self.publishers = aDecoder.decodeObject(forKey: SerializationKeys.publishers) as? [DAODetailGamePublishers]
    self.name = aDecoder.decodeObject(forKey: SerializationKeys.name) as? String
    self.metacriticUrl = aDecoder.decodeObject(forKey: SerializationKeys.metacriticUrl) as? String
    self.playtime = aDecoder.decodeObject(forKey: SerializationKeys.playtime) as? Int
    self.genres = aDecoder.decodeObject(forKey: SerializationKeys.genres) as? [DAODetailGameGenres]
    self.nameOriginal = aDecoder.decodeObject(forKey: SerializationKeys.nameOriginal) as? String
    self.metacritic = aDecoder.decodeObject(forKey: SerializationKeys.metacritic) as? Int
    self.redditCount = aDecoder.decodeObject(forKey: SerializationKeys.redditCount) as? Int
    self.redditLogo = aDecoder.decodeObject(forKey: SerializationKeys.redditLogo) as? String
    self.backgroundImage = aDecoder.decodeObject(forKey: SerializationKeys.backgroundImage) as? String
    self.redditName = aDecoder.decodeObject(forKey: SerializationKeys.redditName) as? String
    self.moviesCount = aDecoder.decodeObject(forKey: SerializationKeys.moviesCount) as? Int
    self.descriptionRaw = aDecoder.decodeObject(forKey: SerializationKeys.descriptionRaw) as? String
    self.reviewsTextCount = aDecoder.decodeObject(forKey: SerializationKeys.reviewsTextCount) as? Int
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(suggestionsCount, forKey: SerializationKeys.suggestionsCount)
    aCoder.encode(addedByStatus, forKey: SerializationKeys.addedByStatus)
    aCoder.encode(backgroundImageAdditional, forKey: SerializationKeys.backgroundImageAdditional)
    aCoder.encode(tags, forKey: SerializationKeys.tags)
    aCoder.encode(updated, forKey: SerializationKeys.updated)
    aCoder.encode(parentPlatforms, forKey: SerializationKeys.parentPlatforms)
    aCoder.encode(creatorsCount, forKey: SerializationKeys.creatorsCount)
    aCoder.encode(id, forKey: SerializationKeys.id)
    aCoder.encode(youtubeCount, forKey: SerializationKeys.youtubeCount)
    aCoder.encode(released, forKey: SerializationKeys.released)
    aCoder.encode(twitchCount, forKey: SerializationKeys.twitchCount)
    aCoder.encode(developers, forKey: SerializationKeys.developers)
    aCoder.encode(screenshotsCount, forKey: SerializationKeys.screenshotsCount)
    aCoder.encode(redditDescription, forKey: SerializationKeys.redditDescription)
    aCoder.encode(website, forKey: SerializationKeys.website)
    aCoder.encode(descriptionValue, forKey: SerializationKeys.descriptionValue)
    aCoder.encode(parentAchievementsCount, forKey: SerializationKeys.parentAchievementsCount)
    aCoder.encode(platforms, forKey: SerializationKeys.platforms)
    aCoder.encode(rating, forKey: SerializationKeys.rating)
    aCoder.encode(stores, forKey: SerializationKeys.stores)
    aCoder.encode(ratingTop, forKey: SerializationKeys.ratingTop)
    aCoder.encode(added, forKey: SerializationKeys.added)
    aCoder.encode(esrbRating, forKey: SerializationKeys.esrbRating)
    aCoder.encode(redditUrl, forKey: SerializationKeys.redditUrl)
    aCoder.encode(gameSeriesCount, forKey: SerializationKeys.gameSeriesCount)
    aCoder.encode(achievementsCount, forKey: SerializationKeys.achievementsCount)
    aCoder.encode(alternativeNames, forKey: SerializationKeys.alternativeNames)
    aCoder.encode(dominantColor, forKey: SerializationKeys.dominantColor)
    aCoder.encode(reviewsCount, forKey: SerializationKeys.reviewsCount)
    aCoder.encode(ratingsCount, forKey: SerializationKeys.ratingsCount)
    aCoder.encode(tba, forKey: SerializationKeys.tba)
    aCoder.encode(reactions, forKey: SerializationKeys.reactions)
    aCoder.encode(parentsCount, forKey: SerializationKeys.parentsCount)
    aCoder.encode(metacriticPlatforms, forKey: SerializationKeys.metacriticPlatforms)
    aCoder.encode(slug, forKey: SerializationKeys.slug)
    aCoder.encode(ratings, forKey: SerializationKeys.ratings)
    aCoder.encode(clip, forKey: SerializationKeys.clip)
    aCoder.encode(additionsCount, forKey: SerializationKeys.additionsCount)
    aCoder.encode(saturatedColor, forKey: SerializationKeys.saturatedColor)
    aCoder.encode(publishers, forKey: SerializationKeys.publishers)
    aCoder.encode(name, forKey: SerializationKeys.name)
    aCoder.encode(metacriticUrl, forKey: SerializationKeys.metacriticUrl)
    aCoder.encode(playtime, forKey: SerializationKeys.playtime)
    aCoder.encode(genres, forKey: SerializationKeys.genres)
    aCoder.encode(nameOriginal, forKey: SerializationKeys.nameOriginal)
    aCoder.encode(metacritic, forKey: SerializationKeys.metacritic)
    aCoder.encode(redditCount, forKey: SerializationKeys.redditCount)
    aCoder.encode(redditLogo, forKey: SerializationKeys.redditLogo)
    aCoder.encode(backgroundImage, forKey: SerializationKeys.backgroundImage)
    aCoder.encode(redditName, forKey: SerializationKeys.redditName)
    aCoder.encode(moviesCount, forKey: SerializationKeys.moviesCount)
    aCoder.encode(descriptionRaw, forKey: SerializationKeys.descriptionRaw)
    aCoder.encode(reviewsTextCount, forKey: SerializationKeys.reviewsTextCount)
  }

}
