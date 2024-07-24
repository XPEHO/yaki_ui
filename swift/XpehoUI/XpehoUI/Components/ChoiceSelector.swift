//
//  ChoiceSelector.swift
//  XpehoUI
//
//  Created by Ryan Debouvries on 24/07/2024.
//
import SwiftUI

struct ChoiceSelector: View {
    var label: String = "Choice Selector"
    var choicesAvailable: [String] = ["Choice 1", "Choice 2", "Choice 3", "Choice 4", "Choice 5"]
    
    var size: Double = 18.0
    
    var backgroundColor: Color = .white
    var choiceColor: Color = CONTENT_COLOR
    var checkIconColor: Color = XPEHO_COLOR
    var separatorColor: Color = GRAY_LIGHT_COLOR
    
    var onPress: (String) -> Void = { choice in
        debugPrint("The choice \(choice) is pressed")
    }

    @State private var selectedChoice: String? = nil

    var body: some View {
        VStack {
            ForEach(Array(choicesAvailable.enumerated()), id: \.element) { index, choice in
                VStack {
                    HStack {
                        Text(choice)
                            .font(.custom("Raleway-Regular", size: size))
                            .foregroundColor(choiceColor)
                        Spacer()
                        if choice == selectedChoice {
                            Image(systemName: "checkmark")
                                .foregroundColor(checkIconColor)
                        }
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        selectedChoice = choice
                        onPress(choice)
                    }
                    
                    if index < choicesAvailable.count - 1 {
                        Divider()
                            .background(separatorColor)
                            .padding(.vertical, 5)
                    }
                }
            }
        }
        .padding(.vertical, 20)
        .padding(.horizontal, 32)
        .background(backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .accessibilityIdentifier(label)
        
    }
}

#Preview {
    ChoiceSelector()
}

