//
//  ChoiceSelectorView.swift
//  XpehoUI
//
//  Created by Ryan Debouvries on 25/07/2024.
//

import SwiftUI

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
    ChoiceSelectorView()
}
