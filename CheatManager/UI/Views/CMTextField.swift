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
    var isPrivate: Bool?
    @State var isEditing: Bool = false
    @Binding var value: String //The value of the textfield to pass back
    @Environment(\.colorScheme) var colorScheme //Keep track of what colors the textfield should be(configured to iOS)
    
    var showableRules: [CMTextFieldRules] {
        print("Returning showable rules!")
        if rules != nil {
            if self.isPrivate != nil && self.isPrivate! {
                return self.rules!.filter({ thisRule in
                    return !thisRule.isFulfilled
                })
            } else {
                if self.isEditing {
                    return self.rules!
                } else {
                    return self.rules!.filter({ thisRule in
                        return !thisRule.isFulfilled
                    })
                }
            }
        } else {
            return []
        }
    }
    
    init(_ placeholder: String, withSystemImage image: String? = nil, for value: Binding<String>, isPrivate: Bool? = false, withRules newRules: [CMTextFieldRules]? = nil) {
        self.placeholder = placeholder
        self.image = image
        self._value = value
        self.isPrivate = isPrivate
        self.rules = newRules
        if self.rules != nil {
            print("Rule count\(self.rules!.count)")
        }
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
                    if (self.isPrivate != nil && self.isPrivate!) {
                        SecureField(self.placeholder, text: self.$value) {
                            self.isEditing = false
                        }.disableAutocorrection(true)
                        .textFieldStyle(PlainTextFieldStyle())
                    } else {
                        TextField(self.placeholder, text: self.$value) { changed in
                            if (changed) {
                                self.isEditing = true
                            } else {
                                self.isEditing = false
                            }
                        } onCommit: {
                            self.isEditing = false
                        }.textFieldStyle(PlainTextFieldStyle())
                        .disableAutocorrection(true)
                    }
                }.padding(.horizontal, 6).padding(.vertical, 6)
            }
            if self.rules != nil {
                ForEach(self.showableRules, id: \.self) { rule in
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
