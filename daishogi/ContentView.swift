//
//  ContentView.swift
//  daishogi
//
//  Created by Zachary Abrahamson  on 3/13/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var boardstate: boardState
    var body: some View {
        chessBoard()
            .padding()
            
    }
}

#Preview {
    ContentView()
}
