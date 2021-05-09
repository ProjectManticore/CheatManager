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
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            
            PackagesView()
                .tabItem {
                    Label("Packages", systemImage: "shippingbox.fill")
                }
            
            VerificationView()
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
