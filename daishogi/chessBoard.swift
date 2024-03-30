//
//  chessBoard.swift
//  daishogi
//
//  Created by Zachary Abrahamson  on 3/21/24.
//

import SwiftUI

struct chessBoard: View {
    
    @EnvironmentObject var boardstate: boardState

    
    var body: some View {
        ZStack {
            HStack(spacing: 1) {
                VStack(spacing: 1) {
                    HStack(spacing: 1) {
                        ForEach(1..<16) { col in
                            tileView(posOnBoard: (row: 0, col: 16 - col)).numberCol
                        }
                    }
                    chessTilesView()
                }
                VStack(spacing: 1) {
                    tileView(posOnBoard: (row: 0, col: 0)).empty
                    ForEach(1..<16) { row in
                        tileView(posOnBoard: (row: row, col: 0)).numberRow
                    }
                }
            }
            
        }
        
    }
}

struct chessTilesView: View {
    @EnvironmentObject var boardstate: boardState
//    @EnvironmentObject var namespaceobj: nameSpaceObj
    var body: some View {
        VStack(spacing: 1) {
            ForEach(1..<16) { row in
                HStack(spacing: 1) {
                    ForEach((1..<16)) { col in
                        let arrayPos = ((row - 1) * 15 + col) - 1
                        
                        boardstate.boardLayout[arrayPos]
                            .overlay {
                                if let heldPiece = boardstate.boardLayout[arrayPos].heldPiece {
                                    heldPiece.chipView
//                                        .matchedGeometryEffect(id: "movingPiece", in: nil)
                                }
                            }
                            .onTapGesture {
                                if let movingPiece = boardstate.myHeldPiece {
                                    if (boardstate.validMoves.contains(arrayPos)) {
                                        // Holding a piece and move to a valid tile
                                        if let promoteForm = movingPiece.type.promotesTo,
                                           !movingPiece.type.isPromoted,
                                           (movingPiece.type.isWhite ? (row <= 5) : (row > 10))
                                        {
                                            boardstate.boardLayout[arrayPos].heldPiece = promoteForm
                                        } else {
                                            boardstate.boardLayout[arrayPos].heldPiece = movingPiece.type
                                        }
                                        boardstate.boardLayout[movingPiece.pos].heldPiece = nil
                                    } else {
                                        boardstate.boardLayout[movingPiece.pos].heldPiece = movingPiece.type
                                    }
                                    // Drop the piece
                                    boardstate.validMoves = []
                                    boardstate.myHeldPiece = nil
                                } else {
                                    // Not holding a piece
                                    let currentTile = boardstate.boardLayout[arrayPos]
                                    if let currentPiece = currentTile.heldPiece, (currentPiece.isWhite == boardstate.isWhite) {
                                        // Pick up a valid piece
                                        let newHeldPiece = heldPiece(pos: arrayPos, type: currentPiece)
                                        boardstate.myHeldPiece = newHeldPiece
                                        let validMoves = currentPiece.calculateMoves()
                                        boardstate.validMoves = validMoves
                                        boardstate.boardLayout[arrayPos].heldPiece = nil
                                    }
                                }
                            }
                        
                    }
                }
            }
        }
        
    }
}
