//
//  ContentView.swift
//  Demo
//
//  Created by Omar Zúñiga Lagunas on 02/06/24.
//

import SwiftUI
import DynamicLib

struct ContentView: View {

    init() {
        _ = Hello()
    }

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
