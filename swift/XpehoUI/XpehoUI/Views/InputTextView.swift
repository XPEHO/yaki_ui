//
//  InputTextView.swift
//  XpehoUI
//
//  Created by Ryan Debouvries on 05/08/2024.
//

import SwiftUI

struct InputTextView: View {
    var eyeIcon: Image = Image("Eye")
    var baseIcon: Image = Image("Briefcase")
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                InputText()
                InputText(
                    label: "Input Text Hiddenable",
                    hiddenSwitcherIcon: eyeIcon,
                    isHiddenable: true
                )
                InputText(
                    label: "Input Text With Input",
                    input: "input"
                )
                InputText(
                    label: "Input Text Hiddenable With Input",
                    hiddenSwitcherIcon: eyeIcon,
                    isHiddenable: true,
                    input: "input"
                )
                InputText(
                    label: "Input Text Customed",
                    labelSize: 15.0,
                    inputSize: 20.0,
                    labelColor: RED_INFO_COLOR,
                    backgroundColor: CONTENT_COLOR,
                    inputColor: .white,
                    hiddenSwitcherColor: .white,
                    onInput: testInputFunction
                )
                InputText(
                    label: "Input Text Customed With Input",
                    hiddenSwitcherIcon: eyeIcon,
                    labelSize: 15.0,
                    inputSize: 20.0,
                    labelColor: RED_INFO_COLOR,
                    backgroundColor: CONTENT_COLOR,
                    inputColor: .white,
                    hiddenSwitcherColor: .white,
                    onInput: testInputFunction,
                    input: "input"
                )
                InputText(
                    label: "Input Text Hiddenable Customed With Input",
                    hiddenSwitcherIcon: baseIcon,
                    labelSize: 15.0,
                    inputSize: 20.0,
                    labelColor: RED_INFO_COLOR,
                    backgroundColor: CONTENT_COLOR,
                    inputColor: .white,
                    hiddenSwitcherColor: .white,
                    isHiddenable: true,
                    onInput: testInputFunction,
                    input: "input"
                )
                
                Spacer()
            }
            .padding()
            .navigationTitle("InputText")
        }
        .background(BACKGROUND_COLOR.scaledToFill().edgesIgnoringSafeArea(.all))
    }
}

#Preview {
    InputTextView()
}
