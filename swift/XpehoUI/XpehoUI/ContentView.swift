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
                NavigationLink(destination: TagPillView()) {
                    Text("TagPill")
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

struct TagPillView: View {
    var body: some View {
        VStack {
            TagPill()
            TagPill(
                label: "Tag Pill Customized",
                backgroundColor: GREEN_DARK_COLOR,
                size: 20
            )
            TagPill(
                label: "Tag Pill Important",
                backgroundColor: RED_INFO_COLOR
            )
        }.navigationTitle("TagPill")
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
