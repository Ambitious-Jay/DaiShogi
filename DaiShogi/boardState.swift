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
        
        func createTiles(_ initialBoardState: inout [tileView]) {
            for row in 1..<16 {
                for col in 1..<16 {
                    initialBoardState.append(tileView(posOnBoard: (row: row, col: col)))
                }
            }
        }
        
        func setUpBoard(_ initialBoardState: inout [tileView]) {
            initialBoardState[2].heldPiece = dragonKing(isPromoted: false, isWhite: false)
            initialBoardState[1].heldPiece = violentOx(isPromoted: false, isWhite: false)
            initialBoardState[10].heldPiece = rook(isPromoted: false, isWhite: false)
            initialBoardState[27].heldPiece = violentOx(isPromoted: false, isWhite: false)
            initialBoardState[220].heldPiece = goldGeneral(isPromoted: false, isWhite: true)
        }
        
        
        var initialBoardState = [tileView]()
        createTiles(&initialBoardState)
        setUpBoard(&initialBoardState)
        self.boardLayout = initialBoardState
        
        
    }
    @Published var validMoves: [Int] = [Int]()
    @Published var isWhite = false
}

struct heldPiece {
    let pos: Int
    let type: Piece
}
