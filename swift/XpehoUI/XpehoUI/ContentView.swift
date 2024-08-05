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

struct ChoiceSelectorView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ChoiceSelector()
                ChoiceSelector(
                    label: "Choice Selector Customized",
                    choicesAvailable: ["Choice Custom 1", "Choice Custom 2", "Choice Custom 3", "Choice Custom 4", "Choice Custom 5"],
                    size: 20.0,
                    backgroundColor: CONTENT_COLOR,
                    choiceColor: .white,
                    checkIconColor: .white,
                    separatorColor: .white,
                    onPress: testChoiceSelectorFunction
                )
                
                Spacer()
            }
            .padding()
            .navigationTitle("ChoiceSelector")
        }
        .background(BACKGROUND_COLOR.scaledToFill().edgesIgnoringSafeArea(.all))
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
