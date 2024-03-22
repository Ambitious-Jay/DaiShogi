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
            ForEach(1..<16) { row in
                HStack(spacing: 1) {
                    ForEach(1..<16) { col in
                        tileView(position: (row, col))
                    }
                }
                
                
                
            }
        }
    }
}

#Preview {
    chessBoard()
}
