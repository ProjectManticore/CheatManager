//
//  ModDepiction.swift
//  CheatManager
//
//  Created by evelyn on 2021-04-16.
//

import SwiftUI

struct ModDepiction: View {
    @Binding var mod: Mod
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    VStack {
                        Text(mod.name)
                            .font(.title2)
                            .fontWeight(.semibold)
                        Text(mod.maintainer)
                    }
                    Spacer()
                    Button(action: {
                        
                    }) {
                        Text("Install")
                            .background(Color.blue)
                            .cornerRadius(15)
                            .padding(5)
                    }
                }
            }
        }
    }
}




