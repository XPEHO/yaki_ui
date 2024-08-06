//
//  CollapsableCard.swift
//  XpehoUI
//
//  Created by Ryan Debouvries on 25/07/2024.
//

import SwiftUI

struct CollapsableCard: View {
    var label: String = "Collapsable Card"
    var headTag: String = "Head Tag"
    var tags: [String] = ["Tag 1", "Tag 2", "Tag 3"]
    var importantTags: [String] = ["Tag 2"]
    var buttonLabel: String = "Collapsable Action"
    var icon: Image = Image("Briefcase")
    var openArrowIcon : Image = Image("Chevron-down")
    var closeArrowIcon : Image = Image("Chevron-up")
    
    var size: Double = 18.0
    
    var labelColor: Color = CONTENT_COLOR
    var backgroundColor: Color = .white
    var headTagBackgroundColor: Color = GREEN_DARK_COLOR
    var headTagLabelColor: Color = .white
    var tagBackgroundColor: Color = GREEN_DARK_COLOR
    var tagLabelColor: Color = .white
    var importantTagBackgroundColor: Color = RED_INFO_COLOR
    var importantTagLabelColor: Color = .white
    var arrowColor: Color = CONTENT_COLOR
    var iconColor: Color = XPEHO_COLOR
    var buttonBackgroundColor: Color = XPEHO_COLOR
    var buttonLabelColor: Color = .white
    
    var isCollapsable: Bool = true
    var isHeadTagVisible: Bool = true
    var isButtonVisible: Bool = true
    
    var onPressButton: () -> Void = {
        debugPrint("The button is pressed")
    }

    @State var isOpen: Bool = true

    var body: some View {
        VStack (alignment: .leading, spacing: 12) {
            HStack {
                HStack (spacing: 12) {
                    if isCollapsable {
                        icon
                        .renderingMode(.template)
                        .foregroundStyle(iconColor)
                    }
                    Text(label)
                        .foregroundStyle(labelColor)
                        .font(.custom("Raleway-Regular", size: size))
                }
                if isHeadTagVisible {
                    Spacer()
                    TagPill(
                        label: headTag,
                        backgroundColor: headTagBackgroundColor,
                        labelColor: headTagLabelColor
                    )
                }
                Spacer()
                if isCollapsable {
                    (isOpen ? closeArrowIcon : openArrowIcon)
                        .renderingMode(.template)
                        .foregroundStyle(arrowColor)
                } else {
                    icon
                        .renderingMode(.template)
                    .foregroundStyle(iconColor)
                }
            }
            if isOpen {
                VStack (spacing: 22) {
                    WrappingHStack (alignment: .leading) {
                        ForEach(tags, id: \.self) { tag in
                            if importantTags.contains(tag) {
                                TagPill(
                                    label: tag,
                                    backgroundColor: importantTagBackgroundColor,
                                    labelColor: importantTagLabelColor
                                )
                            } else {
                                TagPill(
                                    label: tag,
                                    backgroundColor: tagBackgroundColor,
                                    labelColor: tagLabelColor
                                )
                            }
                        }
                        Spacer()
                    }
                    if isButtonVisible {
                        ClickyButton(
                            label: buttonLabel,
                            backgroundColor: buttonBackgroundColor,
                            labelColor: buttonLabelColor,
                            thinMode: true,
                            onPress: onPressButton
                        )
                    }
                }
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .animation(.easeInOut(duration: 0.2), value: isOpen)
        .onTapGesture {
            if isCollapsable {
                isOpen.toggle()
            }
        }
        
    }
}

#Preview {
    CollapsableCard()
}

