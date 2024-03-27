//
//  chessBoard.swift
//  daishogi
//
//  Created by Zachary Abrahamson  on 3/21/24.
//

import SwiftUI

struct chessBoard: View {
    
    @EnvironmentObject var boardstate: boardState
    var mouseLocation: NSPoint { NSEvent.mouseLocation }

    
    var body: some View {
        ZStack {
            VStack(spacing: 1) {
                ForEach(0..<16) { row in
                    if row == 0 {
                        HStack(spacing: 1) {
                            
                            ForEach(0..<16) { col in
                                tileView(posOnBoard: (row: row, col: 15 - col)).numberCol
                            }
                        }
                    } else {
                        HStack(spacing: 1) {
                            ForEach((1..<16)) { col in
                                let arrayPos = ((row - 1) * 15 + col) - 1
                                
                                boardstate.boardLayout[arrayPos]
                                    .overlay {
                                        if let heldPiece = boardstate.boardLayout[arrayPos].heldPiece {
                                            pieceLook(pieceName: heldPiece.pieceName)
                                        }
                                    }
                                    .onTapGesture {
                                        if let movingPiece = boardstate.myHeldPiece {
                                            if (boardstate.validMoves.contains(arrayPos)) {
                                                // Holding a piece and move to a valid tile
                                                boardstate.boardLayout[arrayPos].heldPiece = movingPiece.type
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
                            tileView(posOnBoard: (row: row, col: 0)).numberRow
                            
                        }
                    }
                }
            }
            if let movingPiece = boardstate.myHeldPiece {
//                pieceLook(pieceName: movingPiece.pieceName)
//                    .onTapGesture {
//                        NSEvent.addLocalMonitorForEvents(matching: [.mouseMoved]) {
//                        return $0
//                    }
//                }
            }
        }
    }
}

#Preview {
    chessBoard()
}
