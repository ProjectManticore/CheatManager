//
//  DataManager.swift
//  CheatManager
//
//  Created by Luca on 06.05.21.
//

import Foundation
import CoreData
import Network
import SwiftUI

class DataManager {
    let networkManager = CMAPI()
    let netwrokMonitor = NWPathMonitor()
    var isNetworkConnected: Bool = true

    init() {
        self.netwrokMonitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                self.isNetworkConnected = true
            } else { self.isNetworkConnected = false }
        }
        
        let queue = DispatchQueue(label: "Monitor")
        self.netwrokMonitor.start(queue: queue)
    }
    
    func receiveFeaturedCheats(managedObjectContext: NSManagedObjectContext, completion: @escaping ([StoreCheat]) -> ()) {
        var ret_arr: [StoreCheat] = []
        if self.isNetworkConnected == true {
            CMAPI().getFeaturedCheats(completion: { (featuredCheats) in
                if DataProvider(persistentContainer: PersistenceController.shared.container, api: CMAPI()).syncFeaturedCheats(featuredCheats: featuredCheats.data, taskContext: managedObjectContext){
                    completion(featuredCheats.data)
                } else {
                    print("[Featured] Sync. failed")
                }
            })
        } else if self.isNetworkConnected == false {
            do {
                let res = try managedObjectContext.fetch(Featured.fetchRequest()) as! [Featured]
                for cheat in res {
                    ret_arr.append(StoreCheat(version: cheat.version, upvotes: cheat.upvotes, downvotes: cheat.downvotes, installations: cheat.installations, createdAt: cheat.createdAt, id: cheat.id, name: cheat.name, author: cheat.author, game: StoreGame(id: cheat.game_id, version: cheat.game_version, name: cheat.game_name, bundleID: cheat.game_bundleid)))
                }
                completion(ret_arr)
            } catch {
                print(error)
            }
        }
    }
    
    func receiveCategoryCheats(category: String, managedObjectContext: NSManagedObjectContext, completion: @escaping ([StoreCheat]) -> ()) {
        var ret_arr: [StoreCheat] = []
        if self.isNetworkConnected == true {
            CMAPI().searchByCategory(Category: category, completion: { (responseCheats) in
                if DataProvider(persistentContainer: PersistenceController.shared.container, api: CMAPI()).syncCheats(cheats: responseCheats.data, taskContext: managedObjectContext){
                    completion(responseCheats.data)
                } else {
                    print("[Featured] Sync. failed")
                }
            })
        } else if self.isNetworkConnected == false {
            do {
                let res = try managedObjectContext.fetch(Featured.fetchRequest()) as! [Featured]
                for cheat in res {
                    ret_arr.append(StoreCheat(version: cheat.version, upvotes: cheat.upvotes, downvotes: cheat.downvotes, installations: cheat.installations, createdAt: cheat.createdAt, id: cheat.id, name: cheat.name, author: cheat.author, game: StoreGame(id: cheat.game_id, version: cheat.game_version, name: cheat.game_name, bundleID: cheat.game_bundleid)))
                }
                completion(ret_arr)
            } catch {
                print(error)
            }
        }
    }
}
