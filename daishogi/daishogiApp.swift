//
//  daishogiApp.swift
//  daishogi
//
//  Created by Zachary Abrahamson  on 3/13/24.
//

import SwiftUI

@main
struct daishogiApp: App {
    var body: some Scene {
        WindowGroup {
            ZStack {
                Rectangle()
                    .foregroundStyle(.clear)
                    .background(VisualEffect())
                ContentView()
                
            }
                

        }
    }
}

struct VisualEffect: NSViewRepresentable {
    func makeNSView(context: Self.Context) -> NSView { return NSVisualEffectView() }
    func updateNSView(_ nsView: NSView, context: Context) { }
}
//work on pieces *not movese*
