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
                                        
                                        if col == 1 || row == 2 {
                                            pieceLook(pieceName: "猛牛")
                                        }
                                    }
                                    .onTapGesture {
                                        let currentTile = boardstate.boardLayout[arrayPos]
                                        
                                        if let currentPiece = currentTile.heldPiece, (currentPiece.isWhite == boardstate.isWhite) {
                                            let validMoves = currentPiece.calculateMoves()
                                            boardstate.validMoves = validMoves
                                        } else {
                                            
                                        }
                                        
                                    }
                                    
                            }
                            tileView(posOnBoard: (row: row, col: 0)).numberRow
                            
                    }
                }
            }
        }
    }
}

#Preview {
    chessBoard()
}
