//
//  XpehoUIApp.swift
//  XpehoUI
//
//  Created by Ryan Debouvries on 18/07/2024.
//

import SwiftUI
import xpeho_ui

@main
struct XpehoUIApp: App {
    
    init() {
        Fonts.registerFonts()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
