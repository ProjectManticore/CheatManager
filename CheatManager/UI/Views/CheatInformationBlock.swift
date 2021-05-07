//
//  CheatInformationBlock.swift
//  CheatManager
//
//  Created by Hallie on 5/3/21.
//

import SwiftUI

//Resuable information block ~ Styled like the information block in app store, to ease code organization
struct CheatInformationBlock: View {
    let cheat: StoreCheat
    var versionString: String { return "\(cheat.version)" }
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
                    Text("Downvotes")
                        .foregroundColor(Color.secondary)
                    Spacer()
                    Text("\(cheat.downvotes)")
                }.padding(.horizontal)
                Divider()
                HStack {
                    Text("Version")
                        .foregroundColor(Color.secondary)
                    Spacer()
                    Text(self.versionString)
                }.padding(.horizontal)
            }.disabled(false)
        }
    }
}
