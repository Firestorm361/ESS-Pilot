//
//  TestingStuff2.swift
//  ESS-Pilot-v2.0
//
//  Created by David Schmeißer on 22.02.23.
//

import SwiftUI

struct TestingStuff2: View {
    @State private var isPresented = false

    var body: some View {
        Button("Zur zweiten View") {
            isPresented.toggle()
        }
        .sheet(isPresented: $isPresented) {
            ZweiteView()
        }
    }
}

struct ZweiteView: View {
    var body: some View {
        Text("Das ist die zweite View!")
    }
}

