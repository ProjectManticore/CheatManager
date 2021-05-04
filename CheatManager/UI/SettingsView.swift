//
//  SettingsView.swift
//  CheatManager
//
//  Created by Luca on 04.05.21.
//

import SwiftUI

struct SettingsView: View {
    @State private var debugMode = true
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                Divider().padding(.horizontal)
                List {
                    Toggle("Debugmode", isOn: $debugMode)
                        .toggleStyle(SwitchToggleStyle(tint: .accentColor))
                }
            }.navigationTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
