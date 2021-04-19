//
//  HomeView.swift
//  CheatManager
//
//  Created by evelyn on 2021-04-16.
//

import SwiftUI
import UIKit

let net = NetworkHandling()

struct HomeView: View {
	@State var image: UIImage = UIImage(named: "Stickerpack")!
	let featuredCheats = [StoreCheat(id: "11", author: "rpwnage", version: "0.0.1", gameIcon: "http://foo.bar", gameBanner: "http://foo.bar", gameName: "Subway Surfers", gameBundleID: "com.some.bundle", gameVersion: "17.2.3"), StoreCheat(id: "11", author: "rpwnage", version: "0.0.1", gameIcon: "http://foo.bar", gameBanner: "http://foo.bar", gameName: "Subway Surfers", gameBundleID: "com.some.bundle", gameVersion: "17.2.3")]
	
    var body: some View {
        NavigationView {
            List {
                VStack {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
							ForEach(featuredCheats) { featuredCheat in
								FeaturedCardView(image: $image, mod: FeaturedPage.CardPackage(imglink: featuredCheat.gameBanner, title: featuredCheat.gameName, mod: Mod(icon: "", name: featuredCheat.gameName, id: featuredCheat.id, gameBundleID: featuredCheat.gameBundleID, gameName: featuredCheat.gameName, maintainer: featuredCheat.author)).mod)
									.frame(width: 300, height: 200)
									.padding()
							}
                        }
                    }
                }
            }
			.navigationTitle(Text("Spotlight"))
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
