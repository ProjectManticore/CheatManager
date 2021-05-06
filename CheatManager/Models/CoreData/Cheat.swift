//
//  Cheat.swift
//  CheatManager
//
//  Created by Luca on 06.05.21.
//

import Foundation
import CoreData

class Cheat: NSManagedObject {
    @NSManaged var version: Double
    @NSManaged var upvotes: Int
    @NSManaged var downvotes: Int
    @NSManaged var installations: Int
    @NSManaged var createdAt: String
    @NSManaged var id: String
    @NSManaged var name: String
    @NSManaged var author: String
    @NSManaged var v: Int
    
    func update(with storeCheat: StoreCheat) throws {
        guard let version = storeCheat.version as Double?,
              let upvotes = storeCheat.upvotes as Int?,
              let downvotes = storeCheat.downvotes as Int?,
              let installations = storeCheat.installations as Int?,
              let createdAt = storeCheat.createdAt as String?,
              let id = storeCheat.id as String?,
              let name = storeCheat.name as String?,
              let author = storeCheat.author as String?,
              let v = storeCheat.v as Int?
              else { throw NSError(domain: "", code: 100, userInfo: nil) }
        
        self.version = version
        self.upvotes = upvotes
        self.downvotes = downvotes
        self.installations = installations
        self.createdAt = createdAt
        self.id = id
        self.name = name
        self.author = author
        self.v = v
    }

}
