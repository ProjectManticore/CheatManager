//
//  SettingsView.swift
//  CheatManager
//
//  Created by Luca on 04.05.21.
//

import SwiftUI

struct SettingsView: View {
    @State private var debugMode = false
    @State private var logVisible = false
    var body: some View {
        CMHostView("Settings") {
            Divider().padding(.horizontal)
            VStack {
                SettingActionSwitch(title: "Debug Mode", on: self.$debugMode, toggleAction: { switchState in
                    print("[Settings] " + (switchState ? "Enabling" : "Disabling" ) + " Debug mode...")
                    UserDefaults.standard.set(switchState, forKey: "debugMode")
                })
                
                SettingActionSwitch(title: "Show log", on: self.$logVisible, toggleAction: { switchState in
                    print("[Settings] " + (switchState ? "Enabling" : "Disabling" ) + " Visible installation log...")
                    UserDefaults.standard.set(switchState, forKey: "logVisible")
                })
            }
        }.onAppear(perform: {
            // Initialize Settings and Make sure all Switches/Fields are equal with UserDefaults
            if UserDefaults.standard.bool(forKey: "debugMode") != self.debugMode { UserDefaults.standard.set(self.debugMode, forKey: "debugMode") }
            if UserDefaults.standard.bool(forKey: "logVisible") != self.logVisible { UserDefaults.standard.set(self.logVisible, forKey: "logVisible") }
        })
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
