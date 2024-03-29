//
//  dragonKing.swift
//  daishogi
//
//  Created by Zachary Abrahamson  on 3/28/24.
//

import Foundation

struct dragonKing: Piece {
    func calculateMoves() -> [Int] {
        var counter = -1
        return Array(repeating: 0, count: 225).map { moo in
            counter += 1
            return counter
        }
    }
    
    var pieceName: String = "龍王"
    var pieceID: pieceTypes = .dragonKing
    var promotesTo: Piece? {
        goldGeneral(isPromoted: true, isWhite: self.isWhite)
    }
    
    var isPromoted: Bool
    var isWhite: Bool
}
