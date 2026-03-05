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
            
            // First column pegs
            VStack {
                if matches.indices.contains(0) { matchMaker(peg: 0)
                }
                
                if matches.indices.contains(1) { matchMaker(peg: 1)
                }
            }
            
            // Second column pegs
            VStack {
                if matches.indices.contains(2) { matchMaker(peg: 2)
                }
                
                if matches.indices.contains(3) { matchMaker(peg: 3)
                }
            }
            
            // Third column pegs
            VStack {
                if matches.indices.contains(4) { matchMaker(peg: 4)
                }
                
                if matches.indices.contains(5) { matchMaker(peg: 5)
                }
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
    var matches: Array<Match>
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
        
        // TODO: Fix error where if only one peg on column its bigger than rest
        
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
