//
//  soaringEagle.swift
//  daishogi
//
//  Created by Zachary Abrahamson  on 3/28/24.
//

import Foundation

struct soaringEagle: Piece {
    func calculateMoves() -> [Int] {
        var counter = -1
        return Array(repeating: 0, count: 225).map { moo in
            counter += 1
            return counter
        }
    }
    
    var pieceName: String = "飛鷲"
    var pieceID: pieceTypes = .soaringEagle
    var promotesTo: Piece? = nil
    
    var isPromoted: Bool
    var isWhite: Bool
}