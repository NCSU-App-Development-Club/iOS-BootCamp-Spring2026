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
            Image(systemName: "globe")
            Text("Welcome to CS193p!")
                .foregroundStyle(.green)
            Text("Greetings!")
            Circle()
        }
        .font(.largeTitle) // vstack can't proccess this. it passes it on
        .padding() // vstack can proccess this
    }
}

#Preview {
    ContentView()
}
