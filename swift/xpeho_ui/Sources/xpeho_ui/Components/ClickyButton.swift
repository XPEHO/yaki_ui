//
//  ClickyButton.swift
//  XpehoUI
//
//  Created by Ryan Debouvries on 18/07/2024.
//

import SwiftUI

public struct ClickyButton: View {
    var label: String
    
    var size: Double
    
    var backgroundColor: Color
    var labelColor: Color
    
    var thinMode: Bool
    var isDisabled: Bool
    
    var onPress: () -> Void
    
    @State private var isPressed = false

    public init(
        label: String = "Clicky Button",
        size: Double = 16,
        backgroundColor: Color = XPEHO_THEME.XPEHO_COLOR,
        labelColor: Color = .white,
        thinMode: Bool = false,
        isDisabled: Bool = false,
        onPress: @escaping () -> Void = {
            debugPrint("The button is pressed")
        }
    ) {
        self.label = label
        self.size = size
        self.backgroundColor = backgroundColor
        self.labelColor = labelColor
        self.thinMode = thinMode
        self.isDisabled = isDisabled
        self.onPress = onPress
    }
    
    public var body: some View {
        Button(action: onPress) {
            Text(label)
                .font(.rubik(.semiBold, size: size))
                .textCase(.uppercase)
                .multilineTextAlignment(.center)
        }
        .padding(.horizontal, thinMode ? 50 : 32)
        .padding(.vertical, thinMode ? 12 : 16)
        .background(isDisabled ? XPEHO_THEME.DISABLED_COLOR : backgroundColor)
        .foregroundStyle(isDisabled ? Color.black.opacity(0.15) : labelColor)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .strokeBorder(Color.black.opacity(0.15), lineWidth: 4)
        )
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(isDisabled ? XPEHO_THEME.DISABLED_COLOR : backgroundColor)
                .fill(Color.black.opacity(0.15))
                .offset(y: isPressed || isDisabled ? 0 : 4)
        )
        .offset(y: isPressed || isDisabled ? 4 : 0)
        .buttonStyle(NoTapAnimationStyle())
        .pressAction {
            isPressed = true
        } onRelease: {
            isPressed = false
        }
        .disabled(isDisabled)
        .accessibilityIdentifier(label)
    }
}

#Preview {
    ClickyButton(
        label: "Button Customized",
        backgroundColor: XPEHO_THEME.XPEHO_COLOR,
        labelColor: .white,
        isDisabled: false,
        onPress: {
            debugPrint("The button is pressed")
        }
    )
}
