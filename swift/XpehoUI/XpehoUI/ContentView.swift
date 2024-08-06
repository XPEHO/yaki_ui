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

func testChoiceSelectorFunction (choice: String) {
    debugPrint("Test is working : \(choice)")
}

func testInputFunction (input: String) {
    debugPrint("Test is working : \(input)")
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
                NavigationLink(destination: FilePreviewButtonView()) {
                    Text("FilePreviewButton")
                }
                NavigationLink(destination: ChoiceSelectorView()) {
                    Text("ChoiceSelector")
                }
                NavigationLink(destination: CollapsableCardView()) {
                    Text("CollapsableCard")
                }
                NavigationLink(destination: InputTextView()) {
                    Text("InputText")
                }
            }
            .navigationTitle("Components")
        }
    }
}

#Preview {
    ContentView()
}

#Preview("ClickyButton") {
    ClickyButtonView()
}

#Preview("TagPill") {
    TagPillView()
}

#Preview("FilePreviewButton") {
    FilePreviewButtonView()
}

#Preview("ChoiceSelector") {
    ChoiceSelectorView()
}

#Preview("CollapsableCard") {
    CollapsableCardView()
}

#Preview("InputText") {
    InputTextView()
}
