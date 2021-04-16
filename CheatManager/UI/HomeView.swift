//
//  HomeView.swift
//  CheatManager
//
//  Created by evelyn on 2021-04-16.
//

import SwiftUI
import UIKit

let net = NetworkHandling()

var testCardPage: [FeaturedPage.CardPackage] = [FeaturedPage.CardPackage(imglink: "https://github.com/marijuanARM/featuredpage/raw/gh-pages/banners/co.shuga.Shuga-Sticker-Pack.jpg", title: "Mod", mod: Mod())]

struct HomeView: View {

    @State var image: UIImage = UIImage()
    var body: some View {
        List {
            VStack {
                ScrollView(.horizontal) {
                    HStack {
                        FeaturedTabs(image: $image, name: "Pacman")
                            .frame(width: 250, height: 150)
                            .padding()
                        FeaturedTabs(image: $image, name: "Tetris")
                            .frame(width: 250, height: 150)
                            .padding()
                        FeaturedTabs(image: $image, name: "Pathless")
                            .frame(width: 250, height: 150)
                            .padding()
                        FeaturedTabs(image: $image, name: "osu!")
                            .frame(width: 250, height: 150)
                            .padding()
                        FeaturedTabs(image: $image, name: "Minecraft")
                            .frame(width: 250, height: 150)
                            .padding()
                        FeaturedTabs(image: $image, name: "Pokemon Go")
                            .frame(width: 250, height: 150)
                            .padding()
                        FeaturedTabs(image: $image, name: "Animal Crossing")
                            .frame(width: 250, height: 150)
                            .padding()
                        FeaturedTabs(image: $image, name: "Clash of Clans")
                            .frame(width: 250, height: 150)
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
    }
}


struct FeaturedTabs: View {
    @Binding var image: UIImage
    var name: String
    @State var hovering: Bool = false
    var body: some View {
        ZStack {
            Image(uiImage: image).resizable()
                .frame(width: 250, height: 150)
                .scaledToFit()
            LinearGradient(gradient: Gradient(colors: [.black, .clear]), startPoint: .bottom, endPoint: .top)
            HStack(alignment: .top) {
                Spacer()
                VStack(alignment: .leading) {
                    Spacer()
                    Text(name)
                        .foregroundColor(Color.white)
                        .fontWeight(.bold)
                        .padding()
                        .font(.title)
                }
            }

        }
        .cornerRadius(15)
        .shadow(radius: 5)
        .padding(.leading, 65)
    }
}
