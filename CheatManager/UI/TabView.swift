//
//  FeaturedView.swift
//  CheatManager
//
//  Created by evelyn on 2021-04-16.
//

import Foundation
import SwiftUI

struct TabView: View {
    @State var id: Int?
    var body: some View{
        NavigationView {
            List {
                NavigationLink(destination: HomeView(), tag: 0, selection: self.$id) {
                    Label("Home", systemImage: "house.fill")
                }
            }
            .listStyle(SidebarListStyle())
            .navigationBarTitle(Text("CheatManager"))
        }
    }
}
