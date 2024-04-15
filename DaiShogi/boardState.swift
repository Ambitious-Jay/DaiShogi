//
//  boardState.swift
//  daishogi
//
//  Created by Zachary Abrahamson  on 3/23/24.
//

import Foundation
import SwiftUI


class boardState: ObservableObject {
    @Published var boardLayout: [tileView]
    @Published var myHeldPiece: heldPiece? = nil
    var setUpBoard: (_ initialBoardState: inout [tileView]) -> ()
    var createTiles: (_ initialBoardState: inout [tileView]) -> ()
    func resetBoard() {
        withAnimation {
            var initialBoardState = [tileView]()
            createTiles(&initialBoardState)
            setUpBoard(&initialBoardState)
            self.boardLayout = initialBoardState
        }
    }
    init() {
        
        func createTiles(_ initialBoardState: inout [tileView]) {
            for row in 1..<16 {
                for col in 1..<16 {
                    initialBoardState.append(tileView(posOnBoard: (row: row, col: col)))
                }
            }
        }
        self.createTiles = createTiles(_:)
        
        func setUpBoard(_ initialBoardState: inout [tileView]) {
            // default promotion is false
            initialBoardState[[0, 14]].heldPieces = lance(isWhite: true).array(count: 2)
            initialBoardState[[1, 13]].heldPieces = knight(isWhite: true).array(count: 2)
            initialBoardState[[2, 12]].heldPieces = stoneGeneral(isWhite: true).array(count: 2)
            initialBoardState[[3, 11]].heldPieces = ironGeneral(isWhite: true).array(count: 2)
            initialBoardState[[4, 10]].heldPieces = copperGeneral(isWhite: true).array(count: 2)
            initialBoardState[[5, 9]].heldPieces = silverGeneral(isWhite: true).array(count: 2)
            initialBoardState[[6, 8]].heldPieces = goldGeneral(isWhite: true).array(count: 2)
            
            initialBoardState[[15, 29]].heldPieces = reverseChariot(isWhite: true).array(count: 2)
            initialBoardState[[17, 27]].heldPieces = catSword(isWhite: true).array(count: 2)
            initialBoardState[[19, 25]].heldPieces = ferociousLeopard(isWhite: true).array(count: 2)
            initialBoardState[[21, 23]].heldPieces = blindTiger(isWhite: true).array(count: 2)
            initialBoardState[22].heldPiece = drunkElephant(isWhite: true)
            
            initialBoardState[[31, 43]].heldPieces = violentOx(isWhite: true).array(count: 2)
            initialBoardState[[33, 41]].heldPieces = angryBoar(isWhite: true).array(count: 2)
            initialBoardState[[35, 39]].heldPieces = evilWolf(isWhite: true).array(count: 2)
            initialBoardState[36].heldPiece = phoenix(isWhite: true)
            initialBoardState[37].heldPiece = lion(isWhite: true)
            initialBoardState[38].heldPiece = kirin(isWhite: true)
            
            initialBoardState[[45, 59]].heldPieces = rook(isWhite: true).array(count: 2)
            initialBoardState[[46, 58]].heldPieces = flyingDragon(isWhite: true).array(count: 2)
            initialBoardState[[47, 57]].heldPieces = sideMover(isWhite: true).array(count: 2)
            initialBoardState[[48, 56]].heldPieces = verticalMover(isWhite: true).array(count: 2)
            initialBoardState[[49, 55]].heldPieces = bishop(isWhite: true).array(count: 2)
            initialBoardState[[50, 54]].heldPieces = dragonHorse(isWhite: true).array(count: 2)
            initialBoardState[[51, 53]].heldPieces = dragonKing(isWhite: true).array(count: 2)
            initialBoardState[52].heldPiece = queen(isWhite: true)
            
            initialBoardState[60..<75] = ArraySlice(initialBoardState[75..<90].map { thing in
                var piece = thing
                piece.heldPiece = pawn(isWhite: true)
                return piece
            })

            initialBoardState[[79, 85]].heldPieces = goBetween(isWhite: true).array(count: 2)
            
            //mirror onto other side of board
            initialBoardState[135..<225] = ArraySlice(initialBoardState[0..<90].reversed().map { tile in
                var mutableTile = tile
                if let _ = mutableTile.heldPiece {
                    mutableTile.heldPiece!.isWhite = false
                }
                return mutableTile
            })
        }
        self.setUpBoard = setUpBoard(_:)
        
        // make sure/remember to update resetBoard when you update anything below this
        var initialBoardState = [tileView]()
        createTiles(&initialBoardState)
        setUpBoard(&initialBoardState)
        self.boardLayout = initialBoardState
        
        
    }
    @Published var validMoves: [Int] = [Int]()
    @Published var isWhite = false
}

struct heldPiece {
    let pos: Int
    let type: Piece
}
