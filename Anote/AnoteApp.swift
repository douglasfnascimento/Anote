//
//  AnoteApp.swift
//  Anote
//
//  Created by Douglas Nascimento on 28/09/23.
//

import SwiftUI

@main
struct AnoteApp: App {
    @StateObject var notesData = Notes()
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ContentView()
                    .environmentObject(notesData)
            }
        }
    }
}
