//
//  CollapsableCardView.swift
//  XpehoUI
//
//  Created by Ryan Debouvries on 25/07/2024.
//

import SwiftUI

struct CollapsableCardView: View {
    var qvstIcon: Image = Image("QVST")
    var newsletterIcon: Image = Image("Newsletter")
    var birthdayIcon: Image = Image("Birthday")
    var baseIcon: Image = Image("Briefcase")
    var chevronUpIcon: Image = Image("Chevron-up")
    var chevronDownIcon: Image = Image("Chevron-down")
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                CollapsableCard(
                    icon: baseIcon,
                    openArrowIcon: chevronDownIcon,
                    closeArrowIcon: chevronUpIcon
                )
                CollapsableCard(
                    label: "QVST Title",
                    tags: ["topic", "_ days remaining", "_/_ completed"],
                    importantTags: ["_ days remaining"],
                    buttonLabel: "Complete",
                    icon: qvstIcon,
                    openArrowIcon: chevronDownIcon,
                    closeArrowIcon: chevronUpIcon,
                    isHeadTagVisible: false
                )
                CollapsableCard(
                    label: "Newsletter #__",
                    headTag: "__/__/____",
                    tags: ["Tag 1", "Tag 2", "Tag 3"],
                    importantTags: [],
                    buttonLabel: "Read",
                    icon: newsletterIcon,
                    openArrowIcon: chevronDownIcon,
                    closeArrowIcon: chevronUpIcon
                )
                CollapsableCard(
                    label: "Birthday of NAME",
                    tags: ["__ MONTH", "__ Y"],
                    importantTags: [],
                    icon: birthdayIcon,
                    openArrowIcon: chevronDownIcon,
                    closeArrowIcon: chevronUpIcon,
                    isCollapsable: false,
                    isHeadTagVisible: false,
                    isButtonVisible: false
                )
                CollapsableCard(
                    label: "Collapsable Card Customized",
                    tags: ["Tag Customized 1", "Tag Customized 2", "Tag Customized 3", "Tag Customized 4"],
                    importantTags: ["Tag Customized 3"],
                    buttonLabel: "Action",
                    icon: baseIcon,
                    openArrowIcon: chevronDownIcon,
                    closeArrowIcon: chevronUpIcon,
                    labelColor: .white,
                    backgroundColor: CONTENT_COLOR,
                    headTagBackgroundColor: .white,
                    headTagLabelColor: RED_INFO_COLOR,
                    tagBackgroundColor: .white,
                    tagLabelColor: CONTENT_COLOR,
                    importantTagBackgroundColor: .white,
                    importantTagLabelColor: RED_INFO_COLOR,
                    arrowColor: .white,
                    iconColor: .white,
                    buttonBackgroundColor: RED_INFO_COLOR,
                    buttonLabelColor: .white
                )
                CollapsableCard(
                    label: "Collapsable Card Closed",
                    icon: baseIcon,
                    openArrowIcon: chevronDownIcon,
                    closeArrowIcon: chevronUpIcon,
                    isOpen: false
                )
                
                Spacer()
            }
            .padding()
            .navigationTitle("CollapsableCard")
        }
        .background(BACKGROUND_COLOR.scaledToFill().edgesIgnoringSafeArea(.all))
    }
}

#Preview {
    CollapsableCardView()
}
