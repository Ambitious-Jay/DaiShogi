//
//  goldGeneral.swift
//  daishogi
//
//  Created by Zachary Abrahamson  on 3/27/24.
//

import Foundation

struct goldGeneral: Piece {
    init(isPromoted: Bool, isWhite: Bool) {
        
        self.isPromoted = isPromoted
        self.isWhite = isWhite
    }
    init(isWhite: Bool) {
        self.isPromoted = false
        self.isWhite = isWhite
    }
    
    func calculateMoves() -> [Int] {
        var counter = -1
        return Array(repeating: 0, count: 225).map { moo in
            counter += 1
            return counter
        }
    }
    
    var pieceName: String = "金将"
    var pieceID: pieceTypes = .goldGeneral
    var promotesTo: Piece? {
        rook(isPromoted: true, isWhite: self.isWhite)
    }
    
    var isPromoted: Bool
    var isWhite: Bool
}
