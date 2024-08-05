//
//  FilePreviewButton.swift
//  XpehoUI
//
//  Created by Ryan Debouvries on 22/07/2024.
//

import SwiftUI

struct FilePreviewButton: View {
    
    var labelLeft: String = "FileName"
    var labelRight: String = "FileInfo"
    var imagePreview: Image = Image("Placeholder")
    var pillTags: [String] = ["Tag Pill 1", "Tag Pill 2", "Tag Pill 3", "Tag Pill 4", "Tag Pill 5", "Tag Pill 6"]
    
    var height: Double = 232
    var labelSize: Double = 18
    
    var backgroundColor: Color = .white
    var labelColor: Color = CONTENT_COLOR
    var pillBackColor: Color = XPEHO_COLOR
    var pillLabelColor: Color = .white
    var arrowColor: Color = .white
    
    var isDisabled: Bool = false
    var isLabelsAbove = true
    
    var onPress: () -> Void = {
        debugPrint("The button is pressed")
    }
    
    @State private var isPressed = false
    
    var body: some View {
        Button(action: onPress) {
            VStack (spacing: 0) {
                if isLabelsAbove {
                    HStack() {
                        Text(labelLeft)
                        Spacer()
                        Text(labelRight)
                    }
                    .foregroundStyle(labelColor)
                    .font(.custom("Raleway-Regular", size: labelSize))
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
                        Image("Arrow-right")
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
                            .init(color: CONTENT_COLOR.opacity(0), location: 0.7),
                            .init(color: CONTENT_COLOR.opacity(1), location: 1)]),
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
                    .font(.custom("Raleway-Regular", size: labelSize))
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

