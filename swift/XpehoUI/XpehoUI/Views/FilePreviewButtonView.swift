//
//  FilePreviewButtonView.swift
//  XpehoUI
//
//  Created by Ryan Debouvries on 25/07/2024.
//

import SwiftUI

struct FilePreviewButtonView: View {
    var imagePreview: Image = Image("Placeholder")
    var arrowRight: Image = Image("Arrow-right")

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                FilePreviewButton(
                    labelLeft: "File Preview Button",
                    labelRight: "",
                    imagePreview: imagePreview,
                    arrowIcon: arrowRight
                )
                FilePreviewButton(
                    labelLeft: "File Preview Button Customized",
                    labelRight: "",
                    imagePreview: imagePreview,
                    pillTags: ["Tag Pill Custom 1", "Tag Pill Custom 2", "Tag Pill Custom 3", "Tag Pill Custom 4"],
                    arrowIcon: arrowRight,
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
                    arrowIcon: arrowRight,
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

#Preview {
    FilePreviewButtonView()
}
