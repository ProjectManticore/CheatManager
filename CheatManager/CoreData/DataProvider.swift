//
//  DataProvider.swift
//  CheatManager
//
//  Created by Luca on 06.05.21.
//

import Foundation
import CoreData

class DataProvider {
    private let persistentContainer: NSPersistentContainer
    private let networkAPI: CMAPI
    
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    init(persistentContainer: NSPersistentContainer, api: CMAPI) {
        self.persistentContainer = persistentContainer
        self.networkAPI = api
    }
    
    func fetchFeatured(completion: @escaping(Error?) -> Void) {
        print("[CoreData] Trying to fetch featured Cheats...")
        networkAPI.getFeaturedCheats(completion: { FeaturedCheatsResponse in
            let featuredCheats = FeaturedCheatsResponse.data
            print("[CoreData] Got a total of \(featuredCheats.count) Cheats...")
            let taskContext = self.persistentContainer.newBackgroundContext()
            taskContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
            taskContext.undoManager = nil
            _ = self.syncFeaturedCheats(featuredCheats: featuredCheats, taskContext: taskContext)
            completion(nil)
        })
    }
    
    private func syncFeaturedCheats(featuredCheats: [StoreCheat], taskContext: NSManagedObjectContext) -> Bool {
        var successfull = false
        taskContext.performAndWait {
            let matchingCheatRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Featured")
            let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: matchingCheatRequest)
            batchDeleteRequest.resultType = .resultTypeObjectIDs
            do {
                let batchDeleteResult = try taskContext.execute(batchDeleteRequest) as? NSBatchDeleteResult
                if let deletedObjectIDs = batchDeleteResult?.result as? [NSManagedObjectID] {
                    NSManagedObjectContext.mergeChanges(fromRemoteContextSave: [NSDeletedObjectsKey: deletedObjectIDs], into: [self.persistentContainer.viewContext])
                }
            } catch {
                print("[CoreData] Error: \(error)\nCould not batch delete existing records.")
                return
            }
            
            for featuredCheat in featuredCheats {
                guard let cheat = NSEntityDescription.insertNewObject(forEntityName: "Cheat", into: taskContext) as? Cheat else {
                    print("[CoreData] Error: Failed to create a new cheat object!")
                    return
                }
                
                do {
                    try cheat.update(with: featuredCheat)
                } catch {
                    print("[CoreData] Error: \(error)\nThe cheat object will be deleted.")
                    taskContext.delete(cheat)
                }
            }
            
            if taskContext.hasChanges {
                do {
                    try taskContext.save()
                } catch {
                    print("[CoreData] Error: \(error)\nCould not save Core Data context.")
                }
                taskContext.reset() // Reset the context to clean up the cache and low the memory footprint.
            }
            successfull = true
        }
        return successfull
    }
}
