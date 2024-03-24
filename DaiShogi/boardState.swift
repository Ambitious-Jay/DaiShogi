//
//  boardState.swift
//  daishogi
//
//  Created by Zachary Abrahamson  on 3/23/24.
//

import Foundation
import SwiftUI


class boardState: ObservableObject {
    @Published var boardLayout: [[tileView]]
    init() {
        var initialBoardState = [[tileView]]()
        for row in 1..<16 {
            var rowState = [tileView]()
            for col in 1..<16 {
                rowState.append(tileView(posOnBoard: (row: row, col: col)))
            }
            initialBoardState.append(rowState)
        }
        self.boardLayout = initialBoardState
    }
}

