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
    // Ignore this variable. This is for development purposes only
    let installedLocally: Bool = false
    @State var upvoted: Bool = false
    @State var downvoted: Bool = false

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
                    if UIDevice.current.userInterfaceIdiom == .pad {
                        Button(action: {
                            print("GET Button pressed.")
                        }) {
                             Text("GET")
                        }.buttonStyle(CellButtonStyle()).padding()
                    }
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
                
                // Upvote/Downvote buttons
                // These will not work until moved out of the list.
                HStack {
                    VStack {
                        Image(systemName: "hand.thumbsup.fill").frame(height: 10)
                            .foregroundColor(self.upvoted == true ? .accentColor : .primary)
                            .onTapGesture {
                                self.downvoted = false
                                self.upvoted = true
                            }
                    }.padding().padding(.leading, 30)
                    
                    Spacer()
                    
                    VStack {
                        Image(systemName: "hand.thumbsdown.fill").frame(height: 10)
                            .foregroundColor(self.downvoted == true ? .accentColor : .primary)
                            .onTapGesture {
                                self.downvoted = true
                                self.upvoted = false
                            }
                    }.padding().padding(.trailing, 30)
                }
            }.disabled(true)
            
            Spacer()

            // Install/Manage Button
            if UIDevice.current.userInterfaceIdiom == .phone {
                ZStack {
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(.accentColor)
                        .padding(.leading, 20).padding(.trailing, 20).padding(.bottom, -20)
                        .frame(height: 80)
                   
                    Text(self.installedLocally == true ? "Modify" : "Install")
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                        .fontWeight(.semibold)
                        .font(.title)
                }.onTapGesture {
                    if self.installedLocally == true {
                        // Pop up a Manage menu (remove/update(?))
                        print("Manage tapped")
                    } else {
                        print("Installing the cheat (ID: \(storeCheat.id), AUTHOR:\(storeCheat.author))")
                    }
                }
            }
            
        }
    }
}
