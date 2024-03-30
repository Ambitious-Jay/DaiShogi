//
//  ContentView.swift
//  daishogi
//
//  Created by Zachary Abrahamson  on 3/13/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var boardstate: boardState
    @State var mouseLocation = CGPoint()
    @State var isHovering = false
//    @Namespace var contentLoco
    
    var body: some View {
        ZStack {
            ZStack {
                Rectangle()
                    .foregroundStyle(.clear)
                    .background(VisualEffect())
                chessBoard()
//                    .environmentObject(nameSpaceObj(contentLoco))
                    .padding()
                
            }
            .overlay {
                if let movingPiece = boardstate.myHeldPiece {
                    movingPiece.type.chipView
                        .animation(.snappy, value: mouseLocation)
                        .position(x: mouseLocation.x, y: mouseLocation.y)
                        .allowsHitTesting(false)
//                    .matchedGeometryEffect(id: "movingPiece", in: contentLoco)
                }
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

struct VisualEffect: NSViewRepresentable {
    func makeNSView(context: Self.Context) -> NSView { return NSVisualEffectView() }
    func updateNSView(_ nsView: NSView, context: Context) { }
}
