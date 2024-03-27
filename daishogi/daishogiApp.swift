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
    @State var mouseLocation = CGPoint()
    @State var isHovering = false
    var body: some Scene {
        WindowGroup {
            ZStack {
                Rectangle()
                    .foregroundStyle(.clear)
                    .background(VisualEffect())
                ContentView()
                    .environmentObject(boardstate)
                
            }
            .overlay {
                if let movingPiece = boardstate.myHeldPiece {
                    pieceLook(pieceName: movingPiece.type.pieceName)
                        .position(x: mouseLocation.x, y: mouseLocation.y)
                        .allowsHitTesting(false)
                }
            }
            .onContinuousHover { phase in
                switch phase {
                case .active(let location):
                    withAnimation(.bouncy) {
                        mouseLocation = location
                    }
                    isHovering = true
                case .ended:
                    isHovering = false
                }
            }
        }
    }
}

struct VisualEffect: NSViewRepresentable {
    func makeNSView(context: Self.Context) -> NSView { return NSVisualEffectView() }
    func updateNSView(_ nsView: NSView, context: Context) { }
}
//work on pieces *not movese*
