//
//  TestingStuff.swift
//  ESS-Pilot-v2.0
//
//  Created by David Schmeißer on 04.12.22.
//

import SwiftUI
import WebKit

struct TestingStuff: View {
    var body: some View {
        
        //Obsolete 
        
        NavigationView {
            WebView(request: URLRequest(url: URL(string: "https://www.esss.de/entschuldigungstool")!))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct WebView: UIViewRepresentable {
    let request: URLRequest

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(request)
    }
}
