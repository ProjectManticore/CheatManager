//
//  HomeView.swift
//  CheatManager
//
//  Created by evelyn on 2021-04-16.
//

import SwiftUI
import UIKit

let net = NetworkHandling()

var testCardPage: [FeaturedPage.CardPackage] = [FeaturedPage.CardPackage(imglink: "https://github.com/marijuanARM/featuredpage/raw/gh-pages/banners/co.shuga.Shuga-Sticker-Pack.jpg", title: "Mod", mod: Mod(icon: "", name: "Some Mod", id: "evelyn.genericMod", gameBundleID: "com.mojang.minecraft", gameName: "Minecraft", maintainer: "evelyn"))]

struct HomeView: View {
    @State var image: UIImage = UIImage()
    var body: some View {
        NavigationView {
            List {
                VStack {
                    ScrollView(.horizontal) {
                        HStack {
                            FeaturedTabs(image: $image, mod: testCardPage[0].mod)
                                .frame(width: 300, height: 200)
                                .padding()
                            FeaturedTabs(image: $image, mod: testCardPage[0].mod)
                                .frame(width: 300, height: 200)
                                .padding()
                            FeaturedTabs(image: $image, mod: testCardPage[0].mod)
                                .frame(width: 300, height: 200)
                                .padding()
                            FeaturedTabs(image: $image, mod: testCardPage[0].mod)
                                .frame(width: 300, height: 200)
                                .padding()
                            FeaturedTabs(image: $image, mod: testCardPage[0].mod)
                                .frame(width: 300, height: 200)
                                .padding()
                            FeaturedTabs(image: $image, mod: testCardPage[0].mod)
                                .frame(width: 300, height: 200)
                                .padding()
                            FeaturedTabs(image: $image, mod: testCardPage[0].mod)
                                .frame(width: 300, height: 200)
                                .padding()
                        }
                    }
                    .onAppear {
                        DispatchQueue.main.async {
                            image = UIImage(data: net.dataRequest(url: testCardPage[0].imglink, json: false, bodyObject: [:])) ?? UIImage()
                        }
                    }
                }
            }
            .navigationTitle(Text("Home"))
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}


struct FeaturedTabs: View {
    @Binding var image: UIImage
    var mod: Mod
    @State var hovering: Bool = false
    var body: some View {
        ZStack {
            Color.gray
            Image(systemName: "shippingbox")
                .font(.largeTitle)
                .foregroundColor(Color.black)
            Image(uiImage: image).resizable()
                .frame(width: 300, height: 200)
                .scaledToFit()
            LinearGradient(gradient: Gradient(colors: [.black, .clear]), startPoint: .bottom, endPoint: .top)
            HStack(alignment: .top) {
                Spacer()
                VStack(alignment: .leading) {
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text(mod.gameName)
                            .font(.callout)
                            .foregroundColor(Color.secondary)
                        Text(mod.name)
                            .fontWeight(.bold)
                            .font(.title)
                            .foregroundColor(Color.white)
                    }
                    .padding()
                }
            }

        }
        .cornerRadius(15)
        .shadow(radius: 5)
    }
}
