//
//  ChoiceSelectorView.swift
//  XpehoUI
//
//  Created by Ryan Debouvries on 25/07/2024.
//

import SwiftUI
import xpeho_ui

struct ChoiceSelectorView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                ChoiceSelector()
                ChoiceSelector(
                    label: "Choice Selector Customized",
                    choicesAvailable: ["Choice Custom 1", "Choice Custom 2", "Choice Custom 3", "Choice Custom 4", "Choice Custom 5"],
                    size: 20.0,
                    backgroundColor: XPEHO_THEME.CONTENT_COLOR,
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
        .background(XPEHO_THEME.BACKGROUND_COLOR.scaledToFill().edgesIgnoringSafeArea(.all))
    }
}

#Preview {
    ChoiceSelectorView()
}
