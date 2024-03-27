//
//  pieceStruct.swift
//  daishogi
//
//  Created by Zachary Abrahamson  on 3/23/24.
//

import Foundation
import SwiftUI

protocol Piece {
    var isWhite: Bool { get set }
    var pieceID: pieceTypes { get set }
    var pieceName: String { get set }
//    var position: Int { get set }
    
    var chipView: any View { get set }
    
    func calculateMoves() -> [Int]
}

extension Piece {
//    var chipView =
}

struct pieceLook: View {
    let pieceName: String
    var body: some View {
        UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(topLeading: 13, bottomLeading: 2, bottomTrailing: 2, topTrailing: 13), style: .circular)
            .fill(Color.darkBkg)
//            .shadow(radius: 5, x: 0.8, y: 0.9)
            .frame(width: 35, height: 45)
            .overlay {
                Text(pieceName)
                    .minimumScaleFactor(0.1)
                    .foregroundStyle(.black)
            }
    }
}

enum pieceTypes {
    case violentOx
}
