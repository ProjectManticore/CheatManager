//
//  SettingSwitch.swift
//  CheatManager
//
//  Created by Hallie on 5/4/21.
//

import SwiftUI

struct SettingSwitch: View {
    var title: String
    @Binding var on: Bool
    
    var body: some View {
        VStack {
            Toggle(title, isOn: self.$on)
                .toggleStyle(SwitchToggleStyle(tint: .accentColor))
            Divider().padding(.horizontal)
        }.padding(.horizontal)
    }
}

// This function represents a Switch with a callback function
struct SettingActionSwitch: View {
    var title: String
    @Binding var on: Bool
    let toggleAction: (Bool) -> Void
    
    var body: some View {
        VStack {
            Toggle(title, isOn: self.$on)
                .toggleStyle(SwitchToggleStyle(tint: .accentColor))
                .onChange(of: self.on, perform: { toggleState in
                    toggleAction(toggleState)
                })
            Divider().padding(.horizontal)
        }.padding(.horizontal)
    }
}
