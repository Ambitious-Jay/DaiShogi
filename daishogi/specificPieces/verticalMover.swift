//
//  verticalMover.swift
//  daishogi
//
//  Created by Zachary Abrahamson  on 4/14/24.
//

import Foundation

struct verticalMover: Piece {
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
    
    var pieceName: String = "竪行"
    var pieceID: pieceTypes = .verticleMover
    var promotesTo: Piece? {
        flyingOx(isPromoted: true, isWhite: self.isWhite)
    }
    
    var isPromoted: Bool
    var isWhite: Bool
}
