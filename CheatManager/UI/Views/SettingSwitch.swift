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
