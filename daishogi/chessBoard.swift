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
                                boardstate.boardLayout[row - 1][col - 1]
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
