//
//  DetailCreatorModel.swift
//  Game Catalogue
//
//  Created by Amin faruq on 12/07/20.
//  Copyright © 2020 Amin faruq. All rights reserved.
//

import Foundation
import RealmSwift

public struct DetailCreatorModel{
    public var id : Int?
    public var name : String?
    public var creators_count : Int?
    public var background_image : String?
    public var background_image_additional : String?
    public var rating : String?
    public var description : String?
}

public struct DetailCreatorPlatfroms{
    public var id : Int?
    public var name : String?
    public var slug : String?
}

public struct DetailCreatorPosition{
    public var id : Int?
    public var name : String?
    public var slug : String?
}

public final class DetailCreatorObject : Object {
    @objc dynamic var id = 0
    @objc dynamic var name = ""
    @objc dynamic var creators_count = 0
    @objc dynamic var background_image = ""
    @objc dynamic var background_image_additional = ""
    @objc dynamic var rating = ""
    @objc dynamic var descriptionCreator = ""
    
    public override class func primaryKey() -> String? {
        return "id"
    }
}

extension DetailCreatorModel : Persistable {
    public init(managedObject: DetailCreatorObject) {
        id = managedObject.id
        name = managedObject.name
        creators_count = managedObject.creators_count
        background_image = managedObject.background_image
        background_image_additional = managedObject.background_image_additional
        rating = managedObject.rating
        description = managedObject.descriptionCreator
    }
    
    public func managedObject() -> DetailCreatorObject {
        let creator = DetailCreatorObject()
        creator.id = id ?? 0
        creator.name = name ?? ""
        creator.creators_count = creators_count ?? 0
        creator.background_image = background_image ?? ""
        creator.background_image_additional = background_image_additional ?? ""
        creator.rating = rating ?? ""
        creator.descriptionCreator = description ?? ""
        return creator
    }
}
