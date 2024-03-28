//
//  boardState.swift
//  daishogi
//
//  Created by Zachary Abrahamson  on 3/23/24.
//

import Foundation
import SwiftUI


class boardState: ObservableObject {
    @Published var boardLayout: [tileView]
    @Published var myHeldPiece: heldPiece? = nil
    init() {
        var initialBoardState = [tileView]()
        for row in 1..<16 {
            for col in 1..<16 {
                initialBoardState.append(tileView(posOnBoard: (row: row, col: col)))
            }
        }
        initialBoardState[2].heldPiece = violentOx(isWhite: true, isPromoted: false)
        self.boardLayout = initialBoardState
        
        
        
    }
    @Published var validMoves: [Int] = [Int]()
    @Published var isWhite = true
}

struct heldPiece {
    let pos: Int
    let type: Piece
}
