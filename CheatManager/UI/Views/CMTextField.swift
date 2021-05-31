//
//  CMTextField.swift
//  CheatManager
//
//  Created by Hallie on 5/8/21.
//

import SwiftUI

struct CMTextFieldRules: Hashable {
    
    var title: String
    var isFulfilled: Bool
}

struct CMTextField: View {
    
    var placeholder: String //Placeholder text for the TextField
    var image: String? //SystemName of the image to use on the left of the screen
    var rules: [CMTextFieldRules]? //Any configurable rules to ensure the user is aware of needs for the fields
    var isSecureField: Bool //Hides text in a field to prevent shoulder peekers from seeing the text
    @Binding var value: String //The value of the textfield to pass back
    @Environment(\.colorScheme) var colorScheme //Keep track of what colors the textfield should be(configured to iOS)
    
    init(_ placeholder: String, withSystemImage image: String? = nil, for value: Binding<String>, withRules newRules: [CMTextFieldRules]? = nil, isSecureField: Bool) {
        self.placeholder = placeholder
        self.image = image
        self._value = value
        self.rules = newRules
        if self.rules != nil {
            print("Rule count\(self.rules!.count)")
        }
        self.isSecureField = isSecureField
    }
    
    var body: some View {
        return VStack(alignment: .leading) {
            ZStack(alignment: .center) {
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(colorScheme == .dark ? Color(red: 27/255, green: 28/255, blue: 30/255) : Color(red: 237/255, green: 238/255, blue: 240/255))
                    .frame(height: 34)
                HStack {
                    if (image != nil && image != "") {
                        Image(systemName: self.image!)
                            .foregroundColor(colorScheme == .dark ? Color(red: 149/255, green: 153/255, blue: 161/255) : Color(red: 130/255, green: 131/255, blue: 134/255))
                    }
                    if isSecureField == false {
                        TextField(self.placeholder, text: self.$value)
                            .textFieldStyle(DefaultTextFieldStyle())
                            .disableAutocorrection(true)
                    } else {
                        SecureField(self.placeholder, text: self.$value)
                            .textFieldStyle(DefaultTextFieldStyle())
                            .disableAutocorrection(true)
                    }
                }.padding(.horizontal, 6).padding(.vertical, 6)
            }
            if self.rules != nil {
                ForEach(self.rules!, id: \.self) { rule in
                    HStack {
                        Image(systemName: rule.isFulfilled ? "checkmark.circle.fill" : "slash.circle.fill")
                            .foregroundColor(rule.isFulfilled ? .green : .red)
                        Text(rule.title)
                    }
                }
            }
        }
    }
}
