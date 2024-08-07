//
//  FilePreviewButton.swift
//  XpehoUI
//
//  Created by Ryan Debouvries on 22/07/2024.
//

import SwiftUI

public struct FilePreviewButton: View {
    
    var labelLeft: String
    var labelRight: String
    var imagePreview: Image
    var pillTags: [String]
    var arrowIcon: Image
    
    var height: Double
    var labelSize: Double
    
    var backgroundColor: Color
    var labelColor: Color
    var pillBackColor: Color
    var pillLabelColor: Color
    var arrowColor: Color
    
    var isDisabled: Bool
    var isLabelsAbove: Bool
    
    var onPress: () -> Void
    
    @State private var isPressed = false

    public init (
        labelLeft: String = "FileName",
        labelRight: String = "FileInfo",
        imagePreview: Image = Assets.loadImage(named: "Placeholder"),
        pillTags: [String] = ["Tag Pill 1", "Tag Pill 2", "Tag Pill 3", "Tag Pill 4", "Tag Pill 5", "Tag Pill 6"],
        arrowIcon: Image = Assets.loadImage(named: "Arrow-right"),
        height: Double = 232,
        labelSize: Double = 18,
        backgroundColor: Color = .white,
        labelColor: Color = XPEHO_THEME.CONTENT_COLOR,
        pillBackColor: Color = XPEHO_THEME.XPEHO_COLOR,
        pillLabelColor: Color = .white,
        arrowColor: Color = .white,
        isDisabled: Bool = false,
        isLabelsAbove: Bool = true,
        onPress: @escaping () -> Void = {
            debugPrint("The button is pressed")
        }
    ) {
        self.labelLeft = labelLeft
        self.labelRight = labelRight
        self.imagePreview = imagePreview
        self.pillTags = pillTags
        self.arrowIcon = arrowIcon
        self.height = height
        self.labelSize = labelSize
        self.backgroundColor = backgroundColor
        self.labelColor = labelColor
        self.pillBackColor = pillBackColor
        self.pillLabelColor = pillLabelColor
        self.arrowColor = arrowColor
        self.isDisabled = isDisabled
        self.isLabelsAbove = isLabelsAbove
        self.onPress = onPress
    }
    
    public var body: some View {
        Button(action: onPress) {
            VStack (spacing: 0) {
                if isLabelsAbove {
                    HStack() {
                        Text(labelLeft)
                        Spacer()
                        Text(labelRight)
                    }
                    .foregroundStyle(labelColor)
                    .font(.raleway(.regular, size: labelSize))
                    .padding(12)
                }
                VStack {
                    Spacer()
                    HStack (alignment: .bottom){
                        GeometryReader { geometry in
                            VStack {
                                Spacer()
                                HStack (alignment: .bottom) {
                                    ForEach(pillTags.prefix(numberOfPillsToShow(in: geometry.size.width)), id: \.self) { tag in
                                        TagPill(
                                            label: tag,
                                            backgroundColor: pillBackColor,
                                            labelColor: pillLabelColor
                                        )
                                        .fixedSize(horizontal: true, vertical: false)
                                    }
                                }
                            }
                        }
                        Spacer()
                        arrowIcon
                            .renderingMode(.template)
                            .foregroundColor(arrowColor)
                            .padding(.leading, 5)
                            .offset(x: isPressed ? 40 : 0)
                            .opacity(isPressed ? 0 : 1)
                            .animation(.easeInOut(duration: 0.2), value: isPressed)
                    }
                    .padding()
                }
                .frame(height: height)
                .background(
                    ZStack {
                        imagePreview
                            .resizable()
                            .scaledToFill()

                        LinearGradient(gradient: Gradient(stops: [
                            .init(color: XPEHO_THEME.CONTENT_COLOR.opacity(0), location: 0.7),
                            .init(color: XPEHO_THEME.CONTENT_COLOR.opacity(1), location: 1)]),
                            startPoint: .top,
                            endPoint: .bottom)
                    }
                )
                if !isLabelsAbove {
                    HStack() {
                        Text(labelLeft)
                        Spacer()
                        Text(labelRight)
                    }
                    .foregroundStyle(labelColor)
                    .font(.raleway(.regular, size: labelSize))
                    .padding(12)
                }
            }
            .background(backgroundColor)
        }
        .grayscale(isDisabled ? 1 : 0)
        .background(backgroundColor)
        .buttonStyle(NoTapAnimationStyle())
        .pressAction {
            isPressed = true
        } onRelease: {
            isPressed = false
        }
        .disabled(isDisabled)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .accessibilityIdentifier(labelLeft)
    }
    
    // Calculate the number of pills that fit in the available width
    func numberOfPillsToShow(in width: CGFloat) -> Int {
        var totalWidth: CGFloat = 0
        var count = 0
        let securityForPaddings: CGFloat = 28
        
        guard let usingFont = UIFont(name: "Rubik-SemiBold", size: 10)
        else {
            return 0
        }
        
        for tag in pillTags {
            let pillWidth = tag.widthByFont(usingFont: usingFont) + securityForPaddings
            if totalWidth + pillWidth > width {
                break
            }
            totalWidth += pillWidth
            count += 1
        }
        
        return count
    }
}

#Preview {
    FilePreviewButton()
}

