//
//  ClickyButton.swift
//  XpehoUI
//
//  Created by Ryan Debouvries on 18/07/2024.
//

import SwiftUI

struct ClickyButton: View {
    var label: String = "Clicky Button"
    
    var size: Double = 16
    
    var backgroundColor: Color = XPEHO_COLOR
    var labelColor: Color = .white
    
    var thinMode: Bool = false
    var isDisabled: Bool = false
    
    var onPress: () -> Void = {
        debugPrint("The button is pressed")
    }
    
    @State private var isPressed = false
    
    var body: some View {
        Button(action: onPress) {
            Text(label)
                .font(.custom("Rubik-SemiBold", size: size))
                .textCase(.uppercase)
                .multilineTextAlignment(.center)
        }
        .padding(.horizontal, thinMode ? 50 : 32)
        .padding(.vertical, thinMode ? 12 : 16)
        .background(isDisabled ? DISABLED_COLOR : backgroundColor)
        .foregroundStyle(isDisabled ? Color.black.opacity(0.15) : labelColor)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .strokeBorder(Color.black.opacity(0.15), lineWidth: 4)
        )
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(isDisabled ? DISABLED_COLOR : backgroundColor)
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
        backgroundColor: XPEHO_COLOR,
        labelColor: .white,
        isDisabled: false,
        onPress: {
            debugPrint("The button is pressed")
        }
    )
}
