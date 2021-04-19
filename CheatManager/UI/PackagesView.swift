//
//  PackagesView.swift
//  CheatManager
//
//  Created by Luca on 19.04.21.
//

import SwiftUI

struct PackagesView: View {
    var body: some View {
		NavigationView {
			List {
				Text("Hello, World!")
			}
			.navigationTitle("Packages")
		}
		.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct PackagesView_Previews: PreviewProvider {
    static var previews: some View {
        PackagesView()
    }
}
