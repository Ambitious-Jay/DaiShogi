//
//  violentOx.swift
//  daishogi
//
//  Created by Andrew Jo on 3/24/24.
//

import Foundation
import SwiftUI

//struct violentOx: Piece {
//    
//    var isWhite: Bool
//    var pieceID: Int
//    var position: Int
//    
//    init {
//        
//    }
//}

struct violentOx: View {
    let name = "猛牛"
    var body: some View {
        
            
            
                Rectangle()
                    .foregroundStyle(.black)
                    .overlay {
                        Text(name)
                            
                            .minimumScaleFactor(0.4)
                            .foregroundStyle(.white)
                    }
                    .padding()
            
    }
}
