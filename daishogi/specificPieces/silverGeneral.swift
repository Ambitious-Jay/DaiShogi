//
//  silverGeneral.swift
//  daishogi
//
//  Created by Zachary Abrahamson  on 4/14/24.
//

import Foundation

struct silverGeneral: Piece {
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
    
    var pieceName: String = "銀将"
    var pieceID: pieceTypes = .silverGeneral
    var promotesTo: Piece? {
        verticalMover(isPromoted: true, isWhite: self.isWhite)
    }
    
    var isPromoted: Bool
    var isWhite: Bool
}
