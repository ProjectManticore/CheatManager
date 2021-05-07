//
//  Cheat+CoreDataProperties.swift
//  CheatManager
//
//  Created by Luca on 07.05.21.
//
//

import Foundation
import CoreData

extension Cheat {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Cheat> {
        return NSFetchRequest<Cheat>(entityName: "Cheat")
    }

    @NSManaged public var author: String?
    @NSManaged public var createdAt: String?
    @NSManaged public var downvotes: Int
    @NSManaged public var game_id: String?
    @NSManaged public var id: String?
    @NSManaged public var installations: Int
    @NSManaged public var name: String?
    @NSManaged public var upvotes: Int
    @NSManaged public var version: Double

    func update(with storeCheat: StoreCheat) throws {
        guard let version = storeCheat.version as Double?,
              let upvotes = storeCheat.upvotes as Int?,
              let downvotes = storeCheat.downvotes as Int?,
              let installations = storeCheat.installations as Int?,
              let createdAt = storeCheat.createdAt as String?,
              let id = storeCheat.id as String?,
              let name = storeCheat.name as String?,
              let author = storeCheat.author as String?
              else { throw NSError(domain: "", code: 100, userInfo: nil) }
        
        self.version = version
        self.upvotes = upvotes
        self.downvotes = downvotes
        self.installations = installations
        self.createdAt = createdAt
        self.id = id
        self.name = name
        self.author = author
    }
}

extension Cheat : Identifiable {

}
