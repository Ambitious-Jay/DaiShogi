//
//  flyingStag.swift
//  daishogi
//
//  Created by Zachary Abrahamson  on 3/28/24.
//

import Foundation

struct flyingStag: Piece {
    func calculateMoves() -> [Int] {
        var counter = -1
        return Array(repeating: 0, count: 225).map { moo in
            counter += 1
            return counter
        }
    }
    
    var pieceName: String = "飛鹿"
    var pieceID: pieceTypes = .flyingStag
    var promotesTo: Piece? = nil
    
    var isPromoted: Bool
    var isWhite: Bool
}
