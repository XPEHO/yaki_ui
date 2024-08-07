//
//  TagPill.swift
//  XpehoUI
//
//  Created by Ryan Debouvries on 22/07/2024.
//

import SwiftUI

public struct TagPill: View {
    var label: String
    
    var size: Double
    
    var backgroundColor: Color
    var labelColor: Color
    
    public init(
        label: String = "Tag Pill",
        size: Double = 10.0,
        backgroundColor: Color = XPEHO_THEME.XPEHO_COLOR,
        labelColor: Color = .white
    ) {
        self.label = label
        self.size = size
        self.backgroundColor = backgroundColor
        self.labelColor = labelColor
    }
    
    public var body: some View {
        Text(label)
            .font(.rubik(.semiBold, size: size))
            .textCase(.uppercase)
            .multilineTextAlignment(.center)
            .padding(4)
            .background(backgroundColor)
            .foregroundColor(labelColor)
            .cornerRadius(6)
            .lineLimit(1)
    }
}

#Preview {
    TagPill(
        label: "Tag Pill Customized",
        backgroundColor: XPEHO_THEME.XPEHO_COLOR,
        labelColor: .white
    )
}
