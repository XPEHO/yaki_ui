//
//  InputTextView.swift
//  XpehoUI
//
//  Created by Ryan Debouvries on 05/08/2024.
//

import SwiftUI
import xpeho_ui

struct InputTextView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                InputText()
                InputText(
                    label: "Input Text Hiddenable",
                    isHiddenable: true
                )
                InputText(
                    label: "Input Text With Input",
                    initialInput: "input"
                )
                InputText(
                    label: "Input Text Hiddenable With Input",
                    initialInput: "input",
                    isHiddenable: true
                )
                InputText(
                    label: "Input Text Customed",
                    labelSize: 15.0,
                    inputSize: 20.0,
                    labelColor: XPEHO_THEME.RED_INFO_COLOR,
                    backgroundColor: XPEHO_THEME.CONTENT_COLOR,
                    inputColor: .white,
                    hiddenSwitcherColor: .white,
                    onInput: testInputFunction
                )
                InputText(
                    label: "Input Text Customed With Input",
                    initialInput: "input",
                    labelSize: 15.0,
                    inputSize: 20.0,
                    labelColor: XPEHO_THEME.RED_INFO_COLOR,
                    backgroundColor: XPEHO_THEME.CONTENT_COLOR,
                    inputColor: .white,
                    hiddenSwitcherColor: .white,
                    onInput: testInputFunction
                )
                InputText(
                    label: "Input Text Hiddenable Customed With Input",
                    initialInput: "input",
                    labelSize: 15.0,
                    inputSize: 20.0,
                    labelColor: XPEHO_THEME.RED_INFO_COLOR,
                    backgroundColor: XPEHO_THEME.CONTENT_COLOR,
                    inputColor: .white,
                    hiddenSwitcherColor: .white,
                    isHiddenable: true,
                    onInput: testInputFunction
                )
                
                Spacer()
            }
            .padding()
            .navigationTitle("InputText")
        }
        .background(XPEHO_THEME.BACKGROUND_COLOR.scaledToFill().edgesIgnoringSafeArea(.all))
    }
}

#Preview {
    InputTextView()
}
