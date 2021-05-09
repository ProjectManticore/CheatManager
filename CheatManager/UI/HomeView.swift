//
//  HomeView.swift
//  CheatManager
//
//  Created by evelyn on 2021-04-16.
//

import SwiftUI
import UIKit
import CoreData

struct HomeView: View {
	@State var image: UIImage = UIImage(named: "defaultBanner")!
    @FetchRequest(entity: Cheat.entity(), sortDescriptors: []) var cheats: FetchedResults<Cheat>
    @Environment(\.managedObjectContext) var managedObjectContext
    let dataManager = DataManager()
    @State var featuredCheats: [StoreCheat] =  []
    @State var arcadeCheats: [StoreCheat] = []
        
    var body: some View {
        CMHostView("Market") {
            Divider().padding(.horizontal)
            FeaturedCarousel(cheats: featuredCheats).onAppear(perform: {
                self.dataManager.receiveFeaturedCheats(managedObjectContext: self.managedObjectContext, completion: { cheats in
                    self.featuredCheats = cheats
                })
            })
            Divider().padding(.horizontal)
            MarketCarousel(title: "Arcade Games", cheats: arcadeCheats).onAppear(perform: {
                self.dataManager.receiveCategoryCheats(category: "arcade", managedObjectContext: self.managedObjectContext, completion: { cheats in
                    self.arcadeCheats = cheats
                })
            })
            Divider().padding(.horizontal)
            MarketCarousel(title: "Classic Games", cheats: arcadeCheats)
            Divider().padding(.horizontal)
            MarketCarousel(title: "Adventure", cheats: arcadeCheats)
            Divider().padding(.horizontal)
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
