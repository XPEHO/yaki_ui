//
//  Utils.swift
//  XpehoUI
//
//  Created by Ryan Debouvries on 18/07/2024.
//

import Foundation
import SwiftUI

// Constants
let XPEHO_COLOR: Color = Color(hex: 0xA0CE4E)
let XPEHO_DARK_COLOR: Color = Color(hex: 0x88AF41)
let GREEN_DARK_COLOR: Color = Color(hex: 0x3F6D34)
let RED_INFO_COLOR: Color = Color(hex: 0xD25656)
let DISABLED_COLOR: Color = Color(hex: 0xE6ECEF)
let CONTENT_COLOR: Color = Color(hex: 0x212121)
let BACKGROUND_COLOR: Color = Color(hex: 0xF2F6F9)
let GRAY_LIGHT_COLOR: Color = Color(hex: 0xEEEEEE)

// Handle hexadecimal for colors
extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}

// Handle press and release actions for buttons
struct PressActions: ViewModifier {
    var onPress: () -> Void
    var onRelease: () -> Void
    
    func body(content: Content) -> some View {
        content
            .simultaneousGesture(
                DragGesture(minimumDistance: 0)
                    .onChanged({ _ in
                        onPress()
                    })
                    .onEnded({ _ in
                        onRelease()
                    })
            )
    }
}

extension View {
    func pressAction(onPress: @escaping (() -> Void), onRelease: @escaping (() -> Void)) -> some View {
        modifier(PressActions(onPress: {
            onPress()
        }, onRelease: {
            onRelease()
        }))
    }
}

// Remove button default animations
struct NoTapAnimationStyle: PrimitiveButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            // Make the whole button surface tappable. Without this only content in the label is tappable and not whitespace. Order is important so add it before the tap gesture
            .contentShape(Rectangle())
            .onTapGesture(perform: configuration.trigger)
    }
}

// Converter to view vontroller for snapshot testing
extension View {
    func toViewController() -> UIViewController {
        let vc = UIHostingController(rootView: self)
        vc.view.frame = UIScreen.main.bounds
        return vc
    }
}

// Calculating the width of a string using a font
extension String {
    func widthByFont(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
}

