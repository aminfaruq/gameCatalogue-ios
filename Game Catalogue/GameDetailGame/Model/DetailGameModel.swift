//
//  DetailGameModel.swift
//  Game Catalogue
//
//  Created by Amin faruq on 11/07/20.
//  Copyright © 2020 Amin faruq. All rights reserved.
//

import Foundation
import RealmSwift

struct DetailGameModel{
    public var id : Int?
    public var name : String?
    public var creators_count : Int?
    public var background_image : String?
    public var background_image_additional : String?
    public var released : String?
    public var description : String?
    public var website : String?
    public var rating : Float?
    public var clip : String?
    public var playtime : Int?
}

public final class DetailGameObject : Object {
    
    @objc dynamic var id = 0
    @objc dynamic var name  = ""
    @objc dynamic var creators_count = 0
    @objc dynamic var background_image  = ""
    @objc dynamic var background_image_additional  = ""
    @objc dynamic var released  = ""
    @objc dynamic var descriptionGame  = ""
    @objc dynamic var website  = ""
    @objc dynamic var rating = 0.0
    @objc dynamic var clip  = ""
    @objc dynamic var playtime = 0
    
    public override class func primaryKey() -> String? {
        return "id"
    }
}


extension DetailGameModel : Persistable {
    
    public init(managedObject: DetailGameObject) {
        id = managedObject.id
        name = managedObject.name
        creators_count = managedObject.creators_count
        background_image = managedObject.background_image
        background_image_additional = managedObject.background_image_additional
        released = managedObject.released
        description = managedObject.descriptionGame
        website = managedObject.website
        rating = Float(managedObject.rating)
        clip = managedObject.clip
        playtime = managedObject.playtime
    }
    
    func managedObject() -> DetailGameObject {
        
        let game = DetailGameObject()
        game.id = id ?? 0
        game.name = name ?? ""
        game.creators_count = creators_count ?? 0
        game.background_image = background_image ?? ""
        game.background_image_additional = background_image_additional ?? ""
        game.released = released ?? ""
        game.descriptionGame = description ?? ""
        game.website = website ?? ""
        game.rating = Double(rating ?? 0.0)
        game.clip = clip ?? ""
        game.playtime = playtime ?? 0
        return game
    }
}

