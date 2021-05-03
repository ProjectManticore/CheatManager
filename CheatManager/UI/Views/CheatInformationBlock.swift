//
//  CheatInformationBlock.swift
//  CheatManager
//
//  Created by Hallie on 5/3/21.
//

import SwiftUI

struct CheatInformationBlock: View { //Resuable information block ~ Styled like the information block in app store, to ease code organization
    let cheat: StoreCheat
    var versionString: String { //This exists to get rid of trailing 0's added without it
        return "\(cheat.version)"
    }
    // Ignore this variable. This is for development purposes only
    @State var upvoted: Bool = true
    @State var downvoted: Bool = false

    var body: some View {
        return VStack(alignment: .leading) {
            
            Text("Information")
                .font(.title)
                .fontWeight(.semibold)
                .multilineTextAlignment(.leading)
                .padding(.vertical)
            
            VStack {
                
                HStack {
                    Text("Installations")
                        .foregroundColor(Color.secondary)
                    Spacer()
                    Text("\(cheat.installations)")
                }.padding(.horizontal)
                
                Divider()
                
                HStack {
                    Text("Upvotes")
                        .foregroundColor(Color.secondary)
                    Spacer()
                    Text("\(cheat.upvotes)")
                }.padding(.horizontal)
                
                Divider()
                
                HStack {
                    Text("Author")
                        .foregroundColor(Color.secondary)
                    Spacer()
                    Text("\(cheat.author)")
                }.padding(.horizontal)
                
                Divider()
                
                HStack {
                    Text("Version")
                        .foregroundColor(Color.secondary)
                    Spacer()
                    Text(self.versionString)
                }.padding(.horizontal)
                
                Divider()
                
                // Upvote/Downvote buttons
                // Moved outside of list, still don't work
                HStack {
                    Spacer()
                    VStack {
                        Image(systemName: "hand.thumbsup.fill").frame(height: 10)
                            .foregroundColor(self.upvoted == true ? .blue : .primary)
                            .onTapGesture {
                                self.downvoted = false
                                self.upvoted = true
                                print("UPVOTING")
                            }
                    }
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    
                    VStack {
                        Image(systemName: "hand.thumbsdown.fill").frame(height: 10)
                            .foregroundColor(self.downvoted == true ? .blue : .primary)
                            .onTapGesture {
                                self.downvoted = true
                                self.upvoted = false
                                print("DOWNVOTING")
                            }
                    }
                    Spacer()
                }.padding(.top, 8)
                
                
            }.disabled(true)
        }
    }
}
