//
//  InputText.swift
//  XpehoUI
//
//  Created by Ryan Debouvries on 05/08/2024.
//


import SwiftUI

public struct InputText: View {
    var label: String
    var hiddenSwitcherIcon : Image
    var initialInput: String
    
    var labelSize: Double
    var inputSize: Double
    
    var labelColor: Color
    var backgroundColor: Color
    var inputColor: Color
    var hiddenSwitcherColor: Color
    
    var isHiddenable: Bool
    
    var onInput: (String) -> Void
    
    @State private var isHidden: Bool = true
    @State private var input: String
    @FocusState private var isFocused: Bool

    public init (
        label: String = "Input Text",
        hiddenSwitcherIcon: Image = Assets.loadImage(named: "Eye"),
        initialInput: String = "",
        labelSize: Double = 11.0,
        inputSize: Double = 16.0,
        labelColor: Color = XPEHO_THEME.CONTENT_COLOR.opacity(0.5),
        backgroundColor: Color = .white,
        inputColor: Color = XPEHO_THEME.CONTENT_COLOR,
        hiddenSwitcherColor: Color = XPEHO_THEME.CONTENT_COLOR,
        isHiddenable: Bool = false,
        onInput: @escaping (String) -> Void = { input in
            debugPrint("The input \(input) is typed")
        }
    ) {
        self.label = label
        self.hiddenSwitcherIcon = hiddenSwitcherIcon
        self.initialInput = initialInput
        self.labelSize = labelSize
        self.inputSize = inputSize
        self.labelColor = labelColor
        self.backgroundColor = backgroundColor
        self.inputColor = inputColor
        self.hiddenSwitcherColor = hiddenSwitcherColor
        self.isHiddenable = isHiddenable
        self.onInput = onInput
        self._input = State(initialValue: initialInput)
    }
    
    public var body: some View {
        ZStack (alignment: .leading) {
            Text(label)
                .font(.raleway(.medium, size: input.isEmpty ? inputSize : labelSize))
                .foregroundStyle(labelColor)
                .offset(y: input.isEmpty ? 0 : -(inputSize + 5))
            HStack {
                if (isHiddenable && isHidden) {
                    SecureField(
                        "",
                        text: $input
                    )
                    .font(.roboto(.regular, size: inputSize))
                    .focused($isFocused)
                    .textInputAutocapitalization(.never)
                    .onChange(of: input) { oldValue, newValue in
                        onInput(newValue)
                    }
                    .foregroundStyle(inputColor)
                } else {
                    TextField(
                        "",
                        text: $input
                    )
                    .font(.roboto(.regular, size: inputSize))
                    .focused($isFocused)
                    .textInputAutocapitalization(.never)
                    .onChange(of: input) { oldValue, newValue in
                        onInput(newValue)
                    }
                    .foregroundStyle(inputColor)
                }
                if (!input.isEmpty && isHiddenable){
                    hiddenSwitcherIcon
                        .renderingMode(.template)
                        .foregroundStyle(hiddenSwitcherColor)
                        .pressAction {
                            isHidden = false
                        } onRelease: {
                            isHidden = true
                        }
                }
            }
        }
        .padding(.horizontal, 16)
        .padding(.bottom, 12)
        .padding(.top, input.isEmpty ? 12 : inputSize + 12)
        .background(backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .animation(.easeInOut(duration: 0.2), value: isHidden)
        .animation(.easeInOut(duration: 0.2), value: input.isEmpty)
        .accessibilityIdentifier(label)
    }
}

#Preview {
    InputText()
}

