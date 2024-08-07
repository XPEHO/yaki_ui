//
//  ChoiceSelector.swift
//  XpehoUI
//
//  Created by Ryan Debouvries on 24/07/2024.
//
import SwiftUI

public struct ChoiceSelector: View {
    var label: String
    var choicesAvailable: [String]
    
    var size: Double
    
    var backgroundColor: Color
    var choiceColor: Color
    var checkIconColor: Color
    var separatorColor: Color
    
    var onPress: (String) -> Void

    @State private var selectedChoice: String? = nil

    public init(
        label: String = "Choice Selector",
        choicesAvailable: [String] = ["Choice 1", "Choice 2", "Choice 3", "Choice 4", "Choice 5"],
        size: Double = 18.0,
        backgroundColor: Color = .white,
        choiceColor: Color = XPEHO_THEME.CONTENT_COLOR,
        checkIconColor: Color = XPEHO_THEME.XPEHO_COLOR,
        separatorColor: Color = XPEHO_THEME.GRAY_LIGHT_COLOR,
        onPress: @escaping (String) -> Void = { choice in
            debugPrint("The choice \(choice) is pressed")
        }
    ) {
        self.label = label
        self.choicesAvailable = choicesAvailable
        self.size = size
        self.backgroundColor = backgroundColor
        self.choiceColor = choiceColor
        self.checkIconColor = checkIconColor
        self.separatorColor = separatorColor
        self.onPress = onPress
    }

    public var body: some View {
        VStack {
            ForEach(Array(choicesAvailable.enumerated()), id: \.element) { index, choice in
                VStack {
                    HStack {
                        Text(choice)
                            .font(.raleway(.regular, size: size))
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

