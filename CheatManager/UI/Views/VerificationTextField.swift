//
//  VerificationTextField.swift
//  CheatManager
//
//  Created by Hallie on 5/10/21.
//

import SwiftUI

struct VerificationTextField: View {
    
    var placeholder: String //Placeholder text for the TextField
    var rules: [CMTextFieldRules]? //Any configurable rules to ensure the user is aware of needs for the fields
    var isPrivate: Bool?
    @State var isEditing: Bool = false
    @Binding var value: String //The value of the textfield to pass back
    @Environment(\.colorScheme) var colorScheme //Keep track of what colors the textfield should be(configured to iOS)
    
    var showableRules: [CMTextFieldRules] {
        if value != "" {
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
        } else {
            return []
        }
    }
    
    init(_ placeholder: String, for value: Binding<String>, isPrivate: Bool? = false, withRules newRules: [CMTextFieldRules]? = nil) {
        self.placeholder = placeholder
        self._value = value
        self.isPrivate = isPrivate
        self.rules = newRules
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(self.placeholder)
                    .bold()
                if (self.isPrivate != nil && self.isPrivate!) {
                    SecureField(self.placeholder, text: self.$value) {
                        self.isEditing = false
                    }.disableAutocorrection(true)
                    .textFieldStyle(PlainTextFieldStyle())
                    .padding(.leading)
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
                    .padding(.leading)
                }
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
            Divider().padding(.horizontal)
        }
    }
}
