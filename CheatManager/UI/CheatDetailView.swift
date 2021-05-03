//
//  CheatDetailView.swift
//  CheatManager
//
//  Created by Luca on 20.04.21.
//

import SwiftUI
import CheatKit

extension View {
    func hasScrollEnabled(_ value: Bool) -> some View {
        self.onAppear {
            UITableView.appearance().isScrollEnabled = value
        }
    }
}

struct CheatDetailView: View {
    let storeCheat: StoreCheat

    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .bottomLeading) {
                // Banner Image
                ZStack {
                    // Gamee Banner
                    Image(storeCheat.game.banner)
                        .resizable()
                        .scaledToFill()
                    
                    Rectangle()
                        .foregroundColor(.clear)
                        .background(LinearGradient(gradient: Gradient(colors: [Color(UIColor.systemBackground), Color(UIColor.systemBackground).opacity(0.0)]), startPoint: .bottom, endPoint: .top))
                        .frame(maxHeight: .infinity)
                }.frame(minWidth: 0, maxWidth: .infinity).frame(height: 240)

                // Game Icon, Name, Author
                HStack {
                    // Game Icon
                    Image(storeCheat.game.icon)
                        .resizable()
                        .cornerRadius(10)
                        .scaledToFit()
                        .frame(height: 70)
                        .padding(.leading).padding(.top).padding(.bottom).padding(.trailing, 10)
                    
                    VStack(alignment: .leading) {
                        // Cheat Author
                        Text(storeCheat.author)
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.primary).opacity(0.7)
                        
                        // Game Name
                        Text(storeCheat.game.name)
                            .font(.title)
                            .fontWeight(.bold)
                            .lineLimit(1)
                    }
                    
                    Spacer()
                    if UIDevice.current.userInterfaceIdiom == .pad {
                        Button(action: {
                            print("GET Button pressed.")
                        }) {
                             Text("GET")
                        }.buttonStyle(CellButtonStyle()).padding()
                    }
                }
            }
            
            ScrollView(.vertical, showsIndicators: false) {
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.")
                    .font(.body)
                    .padding()
                
                CheatInformationBlock(cheat: storeCheat).padding(.horizontal).padding(.bottom, 50)
            }
            
            Spacer()

            // Install/Manage Button
            if UIDevice.current.userInterfaceIdiom == .phone {
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(.accentColor)
                        .padding(.horizontal, 20)
                        .frame(height: 65)
                    
//                    if packageManager.isCheatInstalled(storeCheat.id) == true {
//                        Text("Remove")
//                            .fontWeight(.semibold)
//                            .foregroundColor(.white)
//                            .fontWeight(.semibold)
//                            .font(.title)
//                    }else if packageManager.installedCheatVersion(storeCheat.id) < storeCheat.version {
//                        Text("Update")
//                            .fontWeight(.semibold)
//                            .foregroundColor(.white)
//                            .fontWeight(.semibold)
//                            .font(.title)
//                    }
                    
                    Text("Install")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .font(.title)

                }.onTapGesture {
//                    if packageManager.isCheatInstalled(storeCheat.id) == true {
//                        print("Modify tapped")
//                    }else if packageManager.installedCheatVersion(storeCheat.id) < storeCheat.version {
//                        print("Update tapped")
//                    }else {
                    print("Install tapped")
                }
            }
            
        }
    }
}
