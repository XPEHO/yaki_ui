//
//  ClickyButtonView.swift
//  XpehoUI
//
//  Created by Ryan Debouvries on 25/07/2024.
//

import SwiftUI

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

#Preview {
    ClickyButtonView()
}
