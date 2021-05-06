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
        CMHostView("Settings") {
            Divider().padding(.horizontal)
            HStack {
//                Toggle("Debugmode", isOn: $debugMode)
//                    .toggleStyle(SwitchToggleStyle(tint: .accentColor))
                SettingSwitch(title: "Debug Mode", on: self.$debugMode)
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
