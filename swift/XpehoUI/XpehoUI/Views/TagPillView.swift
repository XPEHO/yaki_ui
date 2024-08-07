//
//  TagPillView.swift
//  XpehoUI
//
//  Created by Ryan Debouvries on 25/07/2024.
//

import SwiftUI
import xpeho_ui

struct TagPillView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                TagPill()
                TagPill(
                    label: "Tag Pill Customized",
                    size: 20,
                    backgroundColor: XPEHO_THEME.GREEN_DARK_COLOR
                )
                TagPill(
                    label: "Tag Pill Important",
                    backgroundColor: XPEHO_THEME.RED_INFO_COLOR
                )
                Spacer()
            }
            .padding()
            .navigationTitle("TagPill")
        }
        .background(XPEHO_THEME.BACKGROUND_COLOR.scaledToFill().edgesIgnoringSafeArea(.all))
    }
}

#Preview {
    TagPillView()
}
