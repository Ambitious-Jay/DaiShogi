//
//  queen.swift
//  daishogi
//
//  Created by Zachary Abrahamson  on 4/14/24.
//

import Foundation

struct queen: Piece {
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
    
    var pieceName: String = "奔王"
    var pieceID: pieceTypes = .queen
    var promotesTo: Piece? {
        nil
    }
    
    var isPromoted: Bool
    var isWhite: Bool
}
