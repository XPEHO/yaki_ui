//
//  Utils.swift
//  XpehoUI
//
//  Created by Ryan Debouvries on 18/07/2024.
//

import Foundation
import SwiftUI

// Constants
public struct XPEHO_THEME {
    public static let XPEHO_COLOR: Color = Color(hex: 0xA0CE4E)
    public static let XPEHO_DARK_COLOR: Color = Color(hex: 0x88AF41)
    public static let GREEN_DARK_COLOR: Color = Color(hex: 0x3F6D34)
    public static let RED_INFO_COLOR: Color = Color(hex: 0xD25656)
    public static let DISABLED_COLOR: Color = Color(hex: 0xE6ECEF)
    public static let CONTENT_COLOR: Color = Color(hex: 0x212121)
    public static let BACKGROUND_COLOR: Color = Color(hex: 0xF2F6F9)
    public static let GRAY_LIGHT_COLOR: Color = Color(hex: 0xEEEEEE)
}

// Handle hexadecimal for colors
public extension Color {
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
public struct PressActions: ViewModifier {
    var onPress: () -> Void
    var onRelease: () -> Void
    
    public func body(content: Content) -> some View {
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

public extension View {
    func pressAction(onPress: @escaping (() -> Void), onRelease: @escaping (() -> Void)) -> some View {
        modifier(PressActions(onPress: {
            onPress()
        }, onRelease: {
            onRelease()
        }))
    }
}

// Remove button default animations
public struct NoTapAnimationStyle: PrimitiveButtonStyle {
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            // Make the whole button surface tappable. Without this only content in the label is tappable and not whitespace. Order is important so add it before the tap gesture
            .contentShape(Rectangle())
            .onTapGesture(perform: configuration.trigger)
    }
}

#if canImport(UIKit)
import UIKit

// Converter to view controller for snapshot testing
public extension View {
    func toViewController() -> UIViewController {
        let vc = UIHostingController(rootView: self)
        vc.view.frame = UIScreen.main.bounds
        return vc
    }
}

// Calculating the width of a string using a font
public extension String {
    func widthByFont(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
}

#elseif canImport(AppKit)
import AppKit

// Converter to view controller for snapshot testing
public extension View {
    func toViewController() -> NSViewController {
        let vc = NSHostingController(rootView: self)
        vc.view.frame = NSScreen.main?.frame ?? .zero
        return vc
    }
}

// Calculating the width of a string using a font
public extension String {
    func widthByFont(usingFont font: NSFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
}
#endif

