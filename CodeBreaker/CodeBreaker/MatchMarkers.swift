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
        let pegCount = matches.count
        let columns = (pegCount + 1) / 2
        HStack(alignment: .top) {
            ForEach(0..<columns, id: \.self) { column in
                VStack {
                    ForEach(0..<2) { row in
                        let pegIndex = column * 2 + row
                        if matches.indices.contains(pegIndex) {
                            matchMarker(peg: pegIndex)
                        }
                    }
                }
            }
        }
    }
  
    
    
    func matchMarker(peg: Int) -> some View {
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
            .frame(maxWidth: 50)
        
    }
}

struct MatchMarkersPreview: View {
    var matches: Array<Match>
    var body: some View {
        // adding dummy pegs
        HStack {
            ForEach(0..<matches.count, id: \.self) { _ in
                Circle()
                    .foregroundStyle(.black)
            }
            
            // does checking for each match for peg color
            MatchMarkers(matches: matches)
                .aspectRatio(1, contentMode: .fit)
            
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
