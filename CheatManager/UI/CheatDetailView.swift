//
//  CheatDetailView.swift
//  CheatManager
//
//  Created by Luca on 20.04.21.
//

import SwiftUI

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
            ZStack {
                // Banner Image
                ZStack {
                    // Gamee Banner
                    Image(storeCheat.game.banner)
                        .resizable()
                        .scaledToFill()
                    
                    Rectangle()
                        .foregroundColor(.clear)
                        .background(LinearGradient(gradient: Gradient(colors: [Color(UIColor.systemBackground), Color(UIColor.systemBackground), Color.clear.opacity(0.5)]), startPoint: .bottom, endPoint: .top))
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
                            .foregroundColor(Color.gray).opacity(0.7)
                        
                        // Game Name
                        Text(storeCheat.game.name)
                            .font(.title)
                            .fontWeight(.bold)
                            .lineLimit(1)
                    }
                    
                    Spacer()
                    Button(action: {
                        print("GET Button pressed.")
                    }) {
                         Text("GET")
                    }.buttonStyle(CellButtonStyle()).padding()
                }
            }
            
            List {
                HStack {
                    Text("Installations")
                    Spacer()
                    Text("\(storeCheat.installations)")
                }.padding(.leading)
                
                HStack {
                    Text("Upvotes")
                    Spacer()
                    Text("\(storeCheat.upvotes)")
                }.padding(.leading)
                
                HStack {
                    Text("Author")
                    Spacer()
                    Text("\(storeCheat.author)")
                }.padding(.leading)
                
                HStack {
                    Text("Version")
                    Spacer()
                    Text("\(storeCheat.version)")
                }.padding(.leading)
            }
            .padding(.leading, -20)
            .hasScrollEnabled(false)
            Spacer()

            // Install/Manage Button
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(.accentColor)
                    .padding(20)
                Text("Install")
                    .fontWeight(.semibold)
                    .foregroundColor(.accentColor)
                    .fontWeight(.semibold)
                    .font(.largeTitle)
            }
            
        }
    }
}
