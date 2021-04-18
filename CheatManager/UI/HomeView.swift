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
    @State var image: UIImage = UIImage()
    var body: some View {
        NavigationView {
            List {
                VStack {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
							FeaturedCard(image: $image, mod: FeaturedPage.CardPackage(imglink: "https://github.com/marijuanARM/featuredpage/raw/gh-pages/banners/co.shuga.Shuga-Sticker-Pack.jpg", title: "Mod", mod: Mod(icon: "", name: "Some Mod", id: "evelyn.genericMod", gameBundleID: "com.mojang.minecraft", gameName: "Minecraft", maintainer: "evelyn")).mod)
                                .frame(width: 300, height: 200)
                                .padding()
                        }
                    }
                    .onAppear {
                        DispatchQueue.main.async {
                            image = UIImage(data: net.dataRequest(url: "https://github.com/marijuanARM/featuredpage/raw/gh-pages/banners/co.shuga.Shuga-Sticker-Pack.jpg", json: false, bodyObject: [:])) ?? UIImage()
                        }
                    }
                }
            }
            .navigationTitle(Text("Spotlight"))
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
