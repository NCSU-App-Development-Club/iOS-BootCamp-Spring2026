//
//  ContentView.swift
//  CodeBreaker
//
//  Created by Jonathan Duran-Ortiz on 2/4/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            pegs(colors: [Color.red, .green, .green, .yellow])
            pegs(colors: [.red, .blue, .green, .red])
            pegs(colors: [.red, .yellow, .green, .blue])
        }.padding()
    }
    
    func pegs(colors: Array<Color>) -> some View {
        HStack {
            ForEach(colors.indices, id: \.self, content: { i in
                RoundedRectangle(cornerRadius: 10)
                    .aspectRatio(1, contentMode: .fit)
                    .foregroundStyle(colors[i])
            })
            MatchMarkers(matches: [.exact, .inexact, .nomatch, .exact, .exact, .inexact])
        }
    }
}


#Preview {
    ContentView()
}
