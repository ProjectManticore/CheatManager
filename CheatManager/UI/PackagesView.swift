//
//  PackagesView.swift
//  CheatManager
//
//  Created by Luca on 19.04.21.
//

import SwiftUI

struct PackagesView: View {
    
    @Environment(\.sizeCategory) var sizeCategory
    @State var selectedList: Int = 0
    
    let installedCheats: [StoreCheat] = [
        StoreCheat(version: 1.0, upvotes: 10, downvotes: 0, installations: 100, createdAt: "5/17/2021", id: "230b8", name: "Installed cheat", author: "Hallie", description: "This is a really cool tweka for my game", game: StoreGame(id: "19vh7", version: 15.0, name: "Tetris", bundleID: "com.tetris.coolio")),
        StoreCheat(version: 0.4, upvotes: 0, downvotes: 10, installations: 12, createdAt: "4/13/2021", id: "hb6f2", name: "Never starve", author: "Hallie", description: "Never run out of food", game: StoreGame(id: "16vj9", version: 1.0, name: "Pet Cat", bundleID: "com.petsworld.ownacat"))
    ]
    
    let myCheats: [StoreCheat] = [
        StoreCheat(version: 1.0, upvotes: 10, downvotes: 0, installations: 100, createdAt: "5/17/2021", id: "230b8", name: "Installed cheat", author: "Hallie", description: "This is a really cool tweka for my game", game: StoreGame(id: "19vh7", version: 15.0, name: "Tetris", bundleID: "com.tetris.coolio")),
        StoreCheat(version: 0.4, upvotes: 0, downvotes: 10, installations: 12, createdAt: "4/13/2021", id: "hb6f2", name: "Never starve", author: "Hallie", description: "Never run out of food", game: StoreGame(id: "16vj9", version: 1.0, name: "Pet Cat", bundleID: "com.petsworld.ownacat")),
        StoreCheat(version: 2.4, upvotes: 10, downvotes: 0, installations: 100, createdAt: "5/17/2021", id: "7bj3l", name: "Installed cheat", author: "rpwnage", description: "Made the best tweak", game: StoreGame(id: "19vh7", version: 15.0, name: "Runner", bundleID: "com.tetris.coolio")),
        StoreCheat(version: 0.8, upvotes: 48, downvotes: 15, installations: 68, createdAt: "4/13/2021", id: "8bl54", name: "Never starve", author: "Hallie", description: "Never run out of food", game: StoreGame(id: "16vj9", version: 1.0, name: "Origami Game", bundleID: "com.petsworld.ownacat"))
    ]
    
    var body: some View {
        CMHostView("My Cheats") {
            Picker(selection: self.$selectedList, label: EmptyView()) {
                Text("Installed").tag(0)
                Text("Published").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            ForEach(self.selectedList == 0 ? self.installedCheats : self.myCheats) { cheat in
                VStack {
                    HStack {
                        Image(cheat.game.icon)
                            .resizable()
                            .cornerRadius(10)
                            .scaledToFit()
                            .frame(height: 60)
                        VStack(alignment: .leading) {
                            Text(cheat.game.name)
                                .fontWeight(.medium)
                            Text(cheat.author)
                                .foregroundColor(.gray).opacity(0.8)
                        }
                        Spacer()
                        Button(action: {
                            print("SHOW THE DETAIL THING")
                        }) {
                             Text("GET")
                        }.buttonStyle(CellButtonStyle(sizeCategory: _sizeCategory))
                    }.padding(.horizontal)
                    if cheat != (self.selectedList == 0 ? self.installedCheats : self.myCheats).last {
                        Divider().padding(.horizontal)
                    }
                }
            }
//            if self.selectedList == 0 {
//
//            } else {
//                Text("PUBLISHED CHEATS")
//            }
        }
    }
}

struct PackagesView_Previews: PreviewProvider {
    static var previews: some View {
        PackagesView()
    }
}
