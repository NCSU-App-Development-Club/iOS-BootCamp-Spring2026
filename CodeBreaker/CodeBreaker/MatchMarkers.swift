//
//  MatchMarkers.swift
//  CodeBreaker
//
//  Created by Hruday on 2/26/26.
//

import SwiftUI

enum Match {
    case nomatch
    case exact
    case inexact
}

struct MatchMarkers: View {
    var matches: Array<Match>
    
    var body: some View {
        HStack {
            VStack {
                matchMaker(peg: 0)
                matchMaker(peg: 1)
            }
            
            VStack {
                matchMaker(peg: 2)
                matchMaker(peg: 3)
            }
            
            VStack {
                matchMaker(peg: 4)
                matchMaker(peg: 5)
            }
        }
    }
    
    func matchMaker(peg: Int) -> some View {
        let exactCount: Int = matches.count(where: { match in
            match == .exact
        })
        
        let foundCount: Int = matches.count(where: { match in
            match != .nomatch
        })
        
        return Circle()
            .fill(exactCount > peg ? Color.black : Color.clear)
            .strokeBorder(foundCount > peg ? Color.black : Color.clear, lineWidth: 2)
            .aspectRatio(1, contentMode: .fit)
    }
}

struct MatchMarkersPreview: View {
    var matches: [Match]

    var body: some View {
        HStack {
            ForEach(0..<matches.count, id: \.self) { _ in
                Circle()
                    .foregroundStyle(.black)
                    .aspectRatio(1, contentMode: .fit)
            }
            
            MatchMarkers(matches: matches)
        }
    }
}

#Preview {
    VStack(alignment: .leading) {
        
        // 3 matches
        MatchMarkersPreview(matches: [.exact, .inexact, .nomatch])
        MatchMarkersPreview(matches: [.exact, .exact, .exact])

        // 4 matches
        MatchMarkersPreview(matches: [.exact, .inexact, .nomatch, .nomatch])
        MatchMarkersPreview(matches: [.exact, .exact, .exact, .exact])

        // 5 matches
        MatchMarkersPreview(matches: [.exact, .inexact, .nomatch, .exact, .inexact])

        // 6 matches
        MatchMarkersPreview(matches: [.exact, .inexact, .nomatch, .exact, .exact, .inexact])
        MatchMarkersPreview(matches: [.nomatch, .nomatch, .nomatch, .nomatch, .nomatch, .nomatch])
    }
    .padding()
    .preferredColorScheme(.light)
}
