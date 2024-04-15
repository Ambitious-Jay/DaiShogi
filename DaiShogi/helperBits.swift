//
//  helperBits.swift
//  daishogi
//
//  Created by Zachary Abrahamson  on 3/23/24.
//

import Foundation
import SwiftUI

enum pieceTypes {
    case angryBoar, bishop, blindTiger, catSword, copperGeneral, dragonHorse, dragonKing, drunkElephant, evilWolf, ferociousLeopard, flyingDragon, flyingOx, flyingStag, freeBoar, goBetween, goldGeneral, hornedFalcon, ironGeneral, king, kirin, knight, lance, lion, pawn, phoenix, prince, queen, reverseChariot, rook, sideMover, silverGeneral, stoneGeneral, soaringEagle, verticleMover, violentOx, whale, whiteHorse
}

enum colors {
    case black, white
}

struct RLPos: Comparable {
    static func < (lhs: RLPos, rhs: RLPos) -> Bool {
        let lhsPosToCoord = ((lhs.row - 1) * 15) + (15 - lhs.col)
        let rhsPosToCoord = ((rhs.row - 1) * 15) + (15 - rhs.col)
        return lhsPosToCoord < rhsPosToCoord
    }
    
    //real postition
    var row: Int
    var col: Int
    var value: Int {
        get {
            return ((row - 1) * 15) + (15 - col)
        }
        set {
            self.col = (newValue % 15)
            self.row = (newValue - (newValue % 15)) / 15
        }
    }
}

extension [tileView] {
    subscript(arr: [Int]) -> [tileView] {
        get {
            if arr.sorted(by: >).last! > (self.count - 1) {
                fatalError("Contains an indexing number greater than the last index of the array.")
            }
            return arr.map {
                return self[$0]
            }
        }
        set {
            if newValue.count == arr.count {
                arr.indices.forEach ({
                    self[arr[$0]] = newValue[$0]
                })
            } else {
                fatalError("Cannot set array with \(newValue.count) elements to a space with \(arr.count) elements.")
            }
        }
    }
    
    subscript(arr: [RLPos]) -> [tileView] {
        
        get {
            if arr.sorted(by: >).last!.value > (self.count - 1) {
                fatalError("Contains an indexing number greater than the last index of the array.")
            }
            return arr.map {
                return self[$0]
            }
        }
        set {
            if newValue.count == arr.count {
                arr.forEach ({
                    self[$0] = newValue[$0]
                })
            } else {
                fatalError("Cannot set array with \(newValue.count) elements to a space with \(arr.count) elements.")
            }
        }
    }
    
    subscript(pos: RLPos) -> tileView {
        get {
            self[((pos.row - 1) * 15) + (15 - pos.col)]
        }
        set {
            self[((pos.row - 1) * 15) + (15 - pos.col)] = newValue
        }
    }
    
    var heldPieces: [Piece?] {
        get {
            return self.map { pie in
                return pie.heldPiece
            }
        }
        set {
            if newValue.count == self.count {
                for ind in self.indices {
                    self[ind].heldPiece = newValue[ind]
                }
            } else {
                fatalError("Cannot set array with \(newValue.count) elements to a space with \(self.count) elements.")
            }
        }
    }
}
