//
//  TileView.swift
//  daishogi
//
//  Created by Zachary Abrahamson  on 3/21/24.
//

import SwiftUI

extension Color {
    static let beigie: Color = Color(red: 248/255, green: 228/255, blue: 172/255, opacity: 1.0)
    static let darkBkg: Color = Color(red: 250/255, green: 190/255, blue: 160/255)
}

struct tileView: View {
    let widthHeight = 50.0
    let posOnBoard: (row: Int, col: Int)
    let tileNum: Int
    @EnvironmentObject var boardstate: boardState
    
    
    var heldPiece: Piece? = nil
    
    init(posOnBoard: (row: Int, col: Int)) {
        self.posOnBoard = posOnBoard
        tileNum = (posOnBoard.row - 1) * 15 + posOnBoard.col
    }
    
    var body: some View {
        VStack {
            Rectangle()
                .foregroundStyle(Color.beigie)
                .frame(width: widthHeight, height: widthHeight)
                .overlay {
                    
                }
        }
    }
    var numberRow: some View {
        Text("\(posOnBoard.row)")
            .frame(width: widthHeight, height: widthHeight)
    }
    var numberCol: some View {
        Text("\(posOnBoard.col)" != "0" ? "\(posOnBoard.col)" : " ")
            .frame(width: widthHeight, height: widthHeight)
    }
}


