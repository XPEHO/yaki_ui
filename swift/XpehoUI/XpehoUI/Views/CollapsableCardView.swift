//
//  CollapsableCardView.swift
//  XpehoUI
//
//  Created by Ryan Debouvries on 25/07/2024.
//

import SwiftUI
import xpeho_ui

struct CollapsableCardView: View {
    var qvstIcon: Image = Assets.loadImage(named: "QVST")
    var newsletterIcon: Image = Assets.loadImage(named: "Newsletter")
    var birthdayIcon: Image = Assets.loadImage(named: "Birthday")
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                CollapsableCard()
                CollapsableCard(
                    label: "QVST Title",
                    tags: ["topic", "_ days remaining", "_/_ completed"],
                    importantTags: ["_ days remaining"],
                    buttonLabel: "Complete",
                    icon: qvstIcon,
                    isHeadTagVisible: false
                )
                CollapsableCard(
                    label: "Newsletter #__",
                    headTag: "__/__/____",
                    tags: ["Tag 1", "Tag 2", "Tag 3"],
                    importantTags: [],
                    buttonLabel: "Read",
                    icon: newsletterIcon
                )
                CollapsableCard(
                    label: "Birthday of NAME",
                    tags: ["__ MONTH", "__ Y"],
                    importantTags: [],
                    icon: birthdayIcon,
                    isCollapsable: false,
                    isHeadTagVisible: false,
                    isButtonVisible: false
                )
                CollapsableCard(
                    label: "Collapsable Card Customized",
                    tags: ["Tag Customized 1", "Tag Customized 2", "Tag Customized 3", "Tag Customized 4"],
                    importantTags: ["Tag Customized 3"],
                    buttonLabel: "Action",
                    labelColor: .white,
                    backgroundColor: XPEHO_THEME.CONTENT_COLOR,
                    headTagBackgroundColor: .white,
                    headTagLabelColor: XPEHO_THEME.RED_INFO_COLOR,
                    tagBackgroundColor: .white,
                    tagLabelColor: XPEHO_THEME.CONTENT_COLOR,
                    importantTagBackgroundColor: .white,
                    importantTagLabelColor: XPEHO_THEME.RED_INFO_COLOR,
                    arrowColor: .white,
                    iconColor: .white,
                    buttonBackgroundColor: XPEHO_THEME.RED_INFO_COLOR,
                    buttonLabelColor: .white
                )
                CollapsableCard(
                    label: "Collapsable Card Closed",
                    isDefaultOpen: false
                )
                
                Spacer()
            }
            .padding()
            .navigationTitle("CollapsableCard")
        }
        .background(XPEHO_THEME.BACKGROUND_COLOR.scaledToFill().edgesIgnoringSafeArea(.all))
    }
}

#Preview {
    CollapsableCardView()
}
