//
//  TagPill.swift
//  XpehoUI
//
//  Created by Ryan Debouvries on 22/07/2024.
//

import SwiftUI

struct TagPill: View {
    var label: String = "Tag Pill"
    
    var size: Double = 10.0
    
    var backgroundColor: Color = XPEHO_COLOR
    var labelColor: Color = .white
    
    var body: some View {
        Text(label)
            .font(.custom("Rubik-SemiBold", size: size))
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
        backgroundColor: XPEHO_COLOR,
        labelColor: .white
    )
}
