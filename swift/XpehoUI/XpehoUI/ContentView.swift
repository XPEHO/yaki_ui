//
//  ContentView.swift
//  XpehoUI
//
//  Created by Ryan Debouvries on 18/07/2024.
//

import SwiftUI

func testFunction () {
    debugPrint("Test is working")
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: ClickyButtonView()) {
                    Text("ClickyButton")
                }
                NavigationLink(destination: OtherView()) {
                    Text("Other")
                }
            }
            .navigationTitle("Components")
        }
    }
}

struct ClickyButtonView: View {
    var body: some View {
        VStack {
            ClickyButton()
            ClickyButton(
                label: "Clicky Button Customized",
                onPress: testFunction,
                backgroundColor: .red,
                labelColor: .white,
                size: 20
            )
            ClickyButton(
                label: "Clicky Button Disabled",
                isDisabled: true
            )
        }.navigationTitle("ClickyButton")
    }
}

struct OtherView: View {
    var body: some View {
        VStack {
        }.navigationTitle("Other")
    }
}


#Preview {
    ContentView()
}
