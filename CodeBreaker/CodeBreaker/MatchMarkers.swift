//
//  MatchMarkers.swift
//  CodeBreaker
//
//  Created by Jonathan Duran-Ortiz on 2/5/26.
//
import SwiftUI

enum Match {
    case nomatch
    case exact
    case inexact
}

struct MatchMarkers: View {
    var matches: [Match]
    
    
    var body: some View {
        // we want a grid but let's implement with hstack and vstack for now
        
        // example: if 3 matches then (3+1)/2 = 2 columns
        let columns = (matches.count + 1) / 2
        
        HStack (alignment: .top) {
            ForEach(0..<columns, id: \.self) { col in
                VStack {
                    matchMarker(peg: col * 2)
                    if col * 2 + 1 < matches.count { // only print the second item in row if possible
                        matchMarker(peg: col * 2 + 1)
                    }
                }
            }
        }
        /*
        HStack {
            VStack { // col 0
                matchMarker(peg: 0)
                matchMarker(peg: 1)
            }
            VStack { // col 1
                matchMarker(peg: 2)
                matchMarker(peg: 3)
            }
            
            VStack { // col 2
                matchMarker(peg: 4)
                matchMarker(peg: 5)
            }
        }
         */
    }
    
    func matchMarker(peg: Int) -> some View {
        let exactCount: Int = matches.count(where: {match in match == .exact})
        let foundCount: Int = matches.count(where: {match in match != .nomatch})
        return Circle()
            .fill(exactCount > peg ? Color.primary : Color.clear)
            .strokeBorder(foundCount > peg ? Color.primary : Color.clear, lineWidth: 2)
            .aspectRatio(1, contentMode: .fit)
    }
}

struct MatchMarkersPreview: View {
    var matches: [Match] // passed in 
    
    var body: some View {
        HStack {
            // Requirement 5: Show the same number of dummy pegs as matches
            // \.self is a keypath. it's like hashcode in java. it tells swift to use the value of the item as a unique id
            ForEach(0..<matches.count, id: \.self) { _ in
                Circle()
                    .frame(maxWidth: 50)
            }
            MatchMarkers(matches: matches)
                .frame(maxWidth: 50)
        }
        .padding()
    }
    
    //MatchMarkers(matches: matches)
}

#Preview {
    VStack (alignment: .leading) {
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
    
}
