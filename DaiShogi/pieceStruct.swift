//
//  pieceStruct.swift
//  daishogi
//
//  Created by Zachary Abrahamson  on 3/23/24.
//

import Foundation

protocol Piece {
    var isWhite: Bool { get set }
    var pieceID: Int { get set }
    var position: Int { get set }
    
    func calculateMoves()
    
    func movePiece(newSpot: Int)
}

extension Piece {
    func movePiece(newSpot: Int) {
//        self.position = newSpot
    }
}

