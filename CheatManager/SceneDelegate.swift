//
//  SceneDelegate.swift
//  CheatManager
//
//  Created by evelyn on 2021-04-16.
//

import UIKit
import SwiftUI
import CoreData

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        let persistenceController = PersistenceController.shared
        // Create the SwiftUI view that provides the window contents.
//        #if DEBUG
//        print("[DEBUG] Creating local development entries in CoreData...")
//        for _ in 0..<1 {
//            let featuredItem = Featured(context: persistenceController.container.viewContext)
//            featuredItem.author = "rpwnage"
//            featuredItem.createdAt = "2014-12-11T14:12:00.000Z"
//            featuredItem.downvotes = 5
//            featuredItem.upvotes = 5
//            featuredItem.game_id = "609504d299317c2fc31a9991"
//            featuredItem.id = "6094f566a126956df2710cbb"
//            featuredItem.installations = 100
//            featuredItem.name = "Subway Surfers"
//            featuredItem.version = 1.0
//            
//            featuredItem.game_id = "609509d199317c77751a9992"
//            featuredItem.game_category = "Arcade"
//            featuredItem.game_name = "Subway Surfers"
//            featuredItem.game_bundleid = "com.subwaysurfers.riot"
//            
//            do {
//                try persistenceController.container.viewContext.save()
//            } catch {
//                print(error)
//            }
//        }
//        #endif
        let contentView = ContentView().environment(\.managedObjectContext, persistenceController.container.viewContext)

        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }

    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

