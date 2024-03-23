//
//  chessBoard.swift
//  daishogi
//
//  Created by Zachary Abrahamson  on 3/21/24.
//

import SwiftUI

struct chessBoard: View {
    var body: some View {
        VStack(spacing: 1) {
            ForEach(0..<16) { row in
                if row == 0 {
                    HStack(spacing: 1) {
                        ForEach(1..<17) { col in
                            tileView(position: (row: row, col: col)).numberCol
                        }
                    }
                } else {
                    HStack(spacing: 1) {
                        ForEach(1..<16) { col in
                            tileView(position: (row, col))
                        }
                        tileView(position: (row: row, col: 16)).numberRow
                        
                    }
                    
                }
                
            }
        }
    }
}

#Preview {
    chessBoard()
}
