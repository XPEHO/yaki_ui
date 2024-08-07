//
//  FilePreviewButtonView.swift
//  XpehoUI
//
//  Created by Ryan Debouvries on 25/07/2024.
//

import SwiftUI
import xpeho_ui

struct FilePreviewButtonView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                FilePreviewButton(
                    labelLeft: "File Preview Button",
                    labelRight: ""
                )
                FilePreviewButton(
                    labelLeft: "File Preview Button Customized",
                    labelRight: "",
                    pillTags: ["Tag Pill Custom 1", "Tag Pill Custom 2", "Tag Pill Custom 3", "Tag Pill Custom 4"],
                    height: 200,
                    labelSize: 20,
                    backgroundColor: XPEHO_THEME.CONTENT_COLOR,
                    labelColor: .white,
                    pillBackColor: XPEHO_THEME.RED_INFO_COLOR,
                    arrowColor: XPEHO_THEME.RED_INFO_COLOR,
                    isLabelsAbove: false,
                    onPress: testFunction
                )
                FilePreviewButton(
                    labelLeft: "File Preview Button Disabled",
                    labelRight: "",
                    isDisabled: true
                )
                
                Spacer()
            }
            .padding()
            .navigationTitle("FilePreviewButton")
        }
        .background(XPEHO_THEME.BACKGROUND_COLOR.scaledToFill().edgesIgnoringSafeArea(.all))
    }
}

#Preview {
    FilePreviewButtonView()
}
