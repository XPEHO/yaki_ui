//
//  Fonts.swift
//
//
//  Created by Ryan Debouvries on 06/08/2024.
//

import SwiftUI

// Enumerators of each fonts
public enum RubikFont: String, CaseIterable {
    case black = "Rubik-Black"
    case blackItalic = "Rubik-BlackItalic"
    case bold = "Rubik-Bold"
    case boldItalic = "Rubik-BoldItalic"
    case extraBold = "Rubik-ExtraBold"
    case extraBoldItalic = "Rubik-ExtraBoldItalic"
    case italic = "Rubik-Italic"
    case light = "Rubik-Light"
    case lightItalic = "Rubik-LightItalic"
    case medium = "Rubik-Medium"
    case mediumItalic = "Rubik-MediumItalic"
    case regular = "Rubik-Regular"
    case semiBold = "Rubik-SemiBold"
    case semiBoldItalic = "Rubik-SemiBoldItalic"
}

public enum RalewayFont: String, CaseIterable {
    case black = "Raleway-Black"
    case blackItalic = "Raleway-BlackItalic"
    case bold = "Raleway-Bold"
    case boldItalic = "Raleway-BoldItalic"
    case extraBold = "Raleway-ExtraBold"
    case extraBoldItalic = "Raleway-ExtraBoldItalic"
    case extraLight = "Raleway-ExtraLight"
    case extraLightItalic = "Raleway-ExtraLightItalic"
    case italic = "Raleway-Italic"
    case light = "Raleway-Light"
    case lightItalic = "Raleway-LightItalic"
    case medium = "Raleway-Medium"
    case mediumItalic = "Raleway-MediumItalic"
    case regular = "Raleway-Regular"
    case semiBold = "Raleway-SemiBold"
    case semiBoldItalic = "Raleway-SemiBoldItalic"
    case thin = "Raleway-Thin"
    case thinItalic = "Raleway-ThinItalic"
}

public enum RobotoFont: String, CaseIterable {
    case black = "Roboto-Black"
    case blackItalic = "Roboto-BlackItalic"
    case bold = "Roboto-Bold"
    case boldItalic = "Roboto-BoldItalic"
    case italic = "Roboto-Italic"
    case light = "Roboto-Light"
    case lightItalic = "Roboto-LightItalic"
    case medium = "Roboto-Medium"
    case mediumItalic = "Roboto-MediumItalic"
    case regular = "Roboto-Regular"
    case thin = "Roboto-Thin"
    case thinItalic = "Roboto-ThinItalic"
}

// Give the usage possibility
extension Font {
    // Usage : Text("text").font(.rubik(.bold, size: 18))
    public static func rubik(_ rubik: RubikFont, size: CGFloat) -> Font {
        return .custom(rubik.rawValue, size: size, relativeTo: .body)
    }
    
    // Usage : Text("text").font(.raleway(.bold, size: 18))
    public static func raleway(_ raleway: RalewayFont, size: CGFloat) -> Font {
        return .custom(raleway.rawValue, size: size, relativeTo: .body)
    }
    
    // Usage : Text("text").font(.roboto(.bold, size: 18))
    public static func roboto(_ roboto: RobotoFont, size: CGFloat) -> Font {
        return .custom(roboto.rawValue, size: size, relativeTo: .body)
    }
}

// Register each font one by one
public struct Rubik {
    public static func registerFonts() {
        RubikFont.allCases.forEach {
            Fonts.registerFont(bundle: .module, fontName: $0.rawValue, fontExtension: "ttf")
        }
    }
}

public struct Raleway {
    public static func registerFonts() {
        RalewayFont.allCases.forEach {
            Fonts.registerFont(bundle: .module, fontName: $0.rawValue, fontExtension: "ttf")
        }
    }
}

public struct Roboto {
    public static func registerFonts() {
        RobotoFont.allCases.forEach {
            Fonts.registerFont(bundle: .module, fontName: $0.rawValue, fontExtension: "ttf")
        }
    }
}

// Register an only font file or all fonts in one time
public struct Fonts {
    public static func registerFonts() {
        Rubik.registerFonts()
        Raleway.registerFonts()
        Roboto.registerFonts()
    }
    
    fileprivate static func registerFont(bundle: Bundle, fontName: String, fontExtension: String) {
        guard let fontURL = bundle.url(forResource: fontName, withExtension: fontExtension),
              let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
              let font = CGFont(fontDataProvider) else {
            fatalError("Couldn't create font from filename: \(fontName) with extension \(fontExtension)")
        }
        var error: Unmanaged<CFError>?
        CTFontManagerRegisterGraphicsFont(font, &error)
    }
}
