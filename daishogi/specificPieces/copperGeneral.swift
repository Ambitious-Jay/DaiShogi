//
//  copperGeneral.swift
//  daishogi
//
//  Created by Zachary Abrahamson  on 3/28/24.
//

import Foundation

struct copperGeneral: Piece {
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
    
    var pieceName: String = "銅将"
    var pieceID: pieceTypes = .copperGeneral
    var promotesTo: Piece? {
        sideMover(isPromoted: true, isWhite: self.isWhite)
    }
    
    var isPromoted: Bool
    var isWhite: Bool
    
    
}
