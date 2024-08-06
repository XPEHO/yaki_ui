//
//  InputText.swift
//  XpehoUI
//
//  Created by Ryan Debouvries on 05/08/2024.
//


import SwiftUI

struct InputText: View {
    var label: String = "Input Text"
    var hiddenSwitcherIcon : Image = Image("Eye")
    
    var labelSize: Double = 11.0
    var inputSize: Double = 16.0
    
    var labelColor: Color = CONTENT_COLOR.opacity(0.5)
    var backgroundColor: Color = .white
    var inputColor: Color = CONTENT_COLOR
    var hiddenSwitcherColor: Color = CONTENT_COLOR
    
    var isHiddenable: Bool = false
    
    var onInput: (String) -> Void = { input in
        debugPrint("The input \(input) is typed")
    }
    
    @State private var isHidden: Bool = true
    @State var input: String = ""
    @FocusState private var isFocused: Bool
    
    var body: some View {
        ZStack (alignment: .leading) {
            Text(label)
                .font(.custom("Raleway-Medium", size: input.isEmpty ? inputSize : labelSize))
                .foregroundStyle(labelColor)
                .offset(y: input.isEmpty ? 0 : -(inputSize + 5))
            HStack {
                if (isHiddenable && isHidden) {
                    SecureField(
                        "",
                        text: $input
                    )
                    .font(.custom(input.isEmpty ? "Raleway-Medium" : "Roboto-Regular", size: inputSize))
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
                    .font(.custom(input.isEmpty ? "Raleway-Medium" : "Roboto-Regular", size: inputSize))
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

