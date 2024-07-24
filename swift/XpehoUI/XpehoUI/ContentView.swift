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
                NavigationLink(destination: FilePreviewButtonView()) {
                    Text("FilePreviewButton")
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
        ScrollView {
            VStack(spacing: 20) {
                ClickyButton()
                ClickyButton(
                    label: "Clicky Button Customized",
                    size: 20,
                    backgroundColor: .red,
                    labelColor: .white,
                    onPress: testFunction
                )
                ClickyButton(
                    label: "Clicky Button Disabled",
                    isDisabled: true
                )
                Spacer()
            }
            .padding()
            .navigationTitle("ClickyButton")
        }
        .background(BACKGROUND_COLOR.scaledToFill().edgesIgnoringSafeArea(.all))
    }
}

struct TagPillView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                TagPill()
                TagPill(
                    label: "Tag Pill Customized",
                    size: 20,
                    backgroundColor: GREEN_DARK_COLOR
                )
                TagPill(
                    label: "Tag Pill Important",
                    backgroundColor: RED_INFO_COLOR
                )
                Spacer()
            }
            .padding()
            .navigationTitle("TagPill")
        }
        .background(BACKGROUND_COLOR.scaledToFill().edgesIgnoringSafeArea(.all))
    }
}

struct FilePreviewButtonView: View {
    var imagePreview: Image = Image("Placeholder")

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                FilePreviewButton(
                    labelLeft: "File Preview Button",
                    labelRight: "",
                    imagePreview: imagePreview
                )
                FilePreviewButton(
                    labelLeft: "File Preview Button Customized",
                    labelRight: "",
                    imagePreview: imagePreview,
                    pillTags: ["Tag Pill Custom 1", "Tag Pill Custom 2", "Tag Pill Custom 3", "Tag Pill Custom 4"],
                    height: 200,
                    labelSize: 20,
                    backgroundColor: CONTENT_COLOR,
                    labelColor: .white,
                    pillBackColor: RED_INFO_COLOR,
                    arrowColor: RED_INFO_COLOR,
                    isLabelsAbove: false,
                    onPress: testFunction
                )
                FilePreviewButton(
                    labelLeft: "File Preview Button Disabled",
                    labelRight: "",
                    imagePreview: imagePreview,
                    isDisabled: true
                )
                Spacer()
            }
            .padding()
            .navigationTitle("FilePreviewButton")
        }
        .background(BACKGROUND_COLOR.scaledToFill().edgesIgnoringSafeArea(.all))
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

#Preview("ClickyButton") {
    ClickyButtonView()
}

#Preview("TagPill") {
    TagPillView()
}

#Preview("FilePreviewButton") {
    FilePreviewButtonView()
}
