//
//  daishogiApp.swift
//  daishogi
//
//  Created by Zachary Abrahamson  on 3/13/24.
//

import SwiftUI

@main
struct daishogiApp: App {
    @StateObject var boardstate: boardState = boardState()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(boardstate)
        }
        .commands {
            CommandMenu("Gameplay Edits") {
                Button("Restart Everything") {
                    boardstate.resetBoard()
                    boardstate.isWhite = false
                }
                .keyboardShortcut("r")
            }
        }
    }
}

//work on pieces *not movese*
