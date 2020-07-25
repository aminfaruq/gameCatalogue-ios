//
//  DetailDeveloperModel.swift
//  Game Catalogue
//
//  Created by Amin faruq on 12/07/20.
//  Copyright © 2020 Amin faruq. All rights reserved.
//

import Foundation
import RealmSwift

struct DetailDeveloperModel {
    public var id : Int?
    public var name : String?
    public var slug : String?
    public var games_count : Int?
    public var image_background : String?
    public var description : String?
    
}

public final class DetailDeveloperObject : Object {
    
    @objc dynamic var id = 0
    @objc dynamic var name = ""
    @objc dynamic var slug = ""
    @objc dynamic var games_count = 0
    @objc dynamic var image_background = ""
    @objc dynamic var descriptionDev = ""
    
    public override class func primaryKey() -> String? {
        return "id"
    }
}

extension DetailDeveloperModel : Persistable {
    public init(managedObject: DetailDeveloperObject) {
        id = managedObject.id
        name = managedObject.name
        slug = managedObject.slug
        games_count = managedObject.games_count
        image_background = managedObject.image_background
        description = managedObject.descriptionDev
    }
    
    public func managedObject() -> DetailDeveloperObject {
        let developer = DetailDeveloperObject()
        developer.id = id ?? 0
        developer.name = name ?? ""
        developer.slug = slug ?? ""
        developer.games_count = games_count ?? 0
        developer.image_background = image_background ?? ""
        developer.descriptionDev = description ?? ""
        return developer
    }
    
    
}
