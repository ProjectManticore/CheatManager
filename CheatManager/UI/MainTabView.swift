//
//  FeaturedView.swift
//  CheatManager
//
//  Created by evelyn on 2021-04-16.
//

import Foundation
import SwiftUI

struct MainTabView: View {
    @State var id: Int?
    var body: some View {
        if UIDevice.current.userInterfaceIdiom == .pad {
            NavigationView {
                List {
                    NavigationLink(destination: HomeView(), tag: 0, selection: self.$id) {
                        Label("Home", systemImage: "house.fill")
                    }
                    NavigationLink(destination: PackagesView(), tag: 1, selection: self.$id) {
                        Label("Packages", systemImage: "shippingbox.fill")
                    }
                    NavigationLink(destination: SettingsView(), tag: 2, selection: self.$id) {
                        Label("Settings", systemImage: "gear")
                    }
                }
                .listStyle(SidebarListStyle())
                .navigationBarTitle(Text("CheatManager"))
                .onAppear {
                    self.id = 0
                }
            }
        } else {
            TabView {
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house.fill")
                    }
                
                PackagesView()
                    .tabItem {
                        Label("Packages", systemImage: "shippingbox.fill")
                    }
                
                SettingsView()
                    .tabItem {
                        Label("Settings", systemImage: "gear")
                    }
                
                SearchView()
                    .tabItem {
                        Label("Search", systemImage: "magnifyingglass")
                    }
            }
        }
    }
}
