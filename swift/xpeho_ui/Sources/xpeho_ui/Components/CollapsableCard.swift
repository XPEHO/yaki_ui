//
//  CollapsableCard.swift
//  XpehoUI
//
//  Created by Ryan Debouvries on 25/07/2024.
//

import SwiftUI

public struct CollapsableCard: View {
    var label: String
    var headTag: String
    var tags: [String]
    var importantTags: [String]
    var buttonLabel: String
    var icon: Image
    var openArrowIcon: Image
    var closeArrowIcon: Image
    
    var size: Double
    
    var labelColor: Color
    var backgroundColor: Color
    var headTagBackgroundColor: Color
    var headTagLabelColor: Color
    var tagBackgroundColor: Color
    var tagLabelColor: Color
    var importantTagBackgroundColor: Color
    var importantTagLabelColor: Color
    var arrowColor: Color
    var iconColor: Color
    var buttonBackgroundColor: Color
    var buttonLabelColor: Color
    
    var isCollapsable: Bool
    var isHeadTagVisible: Bool
    var isButtonVisible: Bool
    var isDefaultOpen: Bool
    
    var onPressButton: () -> Void
    
    @State private var isOpen: Bool = true
    
    public init(
        label: String = "Collapsable Card",
        headTag: String = "Head Tag",
        tags: [String] = ["Tag 1", "Tag 2", "Tag 3"],
        importantTags: [String] = ["Tag 2"],
        buttonLabel: String = "Collapsable Action",
        icon: Image = Assets.loadImage(named: "Briefcase"),
        openArrowIcon: Image = Assets.loadImage(named: "Chevron-down"),
        closeArrowIcon: Image = Assets.loadImage(named: "Chevron-up"),
        size: Double = 18.0,
        labelColor: Color = XPEHO_THEME.CONTENT_COLOR,
        backgroundColor: Color = .white,
        headTagBackgroundColor: Color = XPEHO_THEME.GREEN_DARK_COLOR,
        headTagLabelColor: Color = .white,
        tagBackgroundColor: Color = XPEHO_THEME.GREEN_DARK_COLOR,
        tagLabelColor: Color = .white,
        importantTagBackgroundColor: Color = XPEHO_THEME.RED_INFO_COLOR,
        importantTagLabelColor: Color = .white,
        arrowColor: Color = XPEHO_THEME.CONTENT_COLOR,
        iconColor: Color = XPEHO_THEME.XPEHO_COLOR,
        buttonBackgroundColor: Color = XPEHO_THEME.XPEHO_COLOR,
        buttonLabelColor: Color = .white,
        isCollapsable: Bool = true,
        isHeadTagVisible: Bool = true,
        isButtonVisible: Bool = true,
        isDefaultOpen: Bool = true,
        onPressButton: @escaping () -> Void = {
            debugPrint("The button is pressed")
        }
    ) {
        self.label = label
        self.headTag = headTag
        self.tags = tags
        self.importantTags = importantTags
        self.buttonLabel = buttonLabel
        self.icon = icon
        self.openArrowIcon = openArrowIcon
        self.closeArrowIcon = closeArrowIcon
        self.size = size
        self.labelColor = labelColor
        self.backgroundColor = backgroundColor
        self.headTagBackgroundColor = headTagBackgroundColor
        self.headTagLabelColor = headTagLabelColor
        self.tagBackgroundColor = tagBackgroundColor
        self.tagLabelColor = tagLabelColor
        self.importantTagBackgroundColor = importantTagBackgroundColor
        self.importantTagLabelColor = importantTagLabelColor
        self.arrowColor = arrowColor
        self.iconColor = iconColor
        self.buttonBackgroundColor = buttonBackgroundColor
        self.buttonLabelColor = buttonLabelColor
        self.isCollapsable = isCollapsable
        self.isHeadTagVisible = isHeadTagVisible
        self.isButtonVisible = isButtonVisible
        self.isDefaultOpen = isDefaultOpen
        self.onPressButton = onPressButton
        self._isOpen = State(initialValue: isDefaultOpen)
    }
    
    public var body: some View {
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
                        .font(.raleway(.regular, size: size))
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

