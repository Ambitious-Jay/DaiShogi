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
    init() {
        var initialBoardState = [tileView]()
        for row in 1..<16 {
            for col in 1..<16 {
                initialBoardState.append(tileView(posOnBoard: (row: row, col: col)))
            }
        }
        self.boardLayout = initialBoardState
    }
    @Published var validMoves: [Int] = [Int]()
    @Published var isWhite = true
}


