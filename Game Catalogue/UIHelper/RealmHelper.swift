//
//  RealmHelper.swift
//  Game Catalogue
//
//  Created by Amin faruq on 16/07/20.
//  Copyright © 2020 Amin faruq. All rights reserved.
//

import Foundation
import RealmSwift

public protocol Persistable {
    associatedtype ManagedObject: RealmSwift.Object
    init(managedObject: ManagedObject)
    func managedObject() -> ManagedObject
}

public final class WriteTransaction {
    private let realm: Realm
    internal init(realm: Realm) {
        self.realm = realm
    }
    public func add<T: Persistable>(_ value: T) {
        realm.add(value.managedObject(), update: .modified)
    }
}

// Implement the Container
public final class Container {
    private let realm: Realm
    public convenience init() throws {
        try self.init(realm: Realm())
    }
    internal init(realm: Realm) {
        self.realm = realm
    }
    public func write(_ block: (WriteTransaction) throws -> Void)
    throws {
        let transaction = WriteTransaction(realm: realm)
        try realm.write {
            try block(transaction)
        }
    }
}
