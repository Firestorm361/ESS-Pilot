//
//  ContentView.swift
//  ESS-Pilot-v2.0
//
//  Created by Dave on 11.10.22.
//

import SwiftUI

struct ContentView: View {
    
struct CustomColor {
        
    static let superGrau = Color("superGrau")
        
    }
    
@State var selection = 2
    
    /* init() {
        UITabBar.appearance().backgroundColor = .black}*/

    
    var body: some View {


        
        TabView(selection:$selection) {
            
            
            Stundenplan()
                .tabItem(){
                    Image(systemName: "clock.circle")
                    Text("Stundenplan")
                }
                .tag(1)
            
    
            Zentrale()
                .tabItem(){
                    Image(systemName: "books.vertical.circle")
                    Text("Zentrale")
                }
                .tag(2)
            
            
            Noten()
                .tabItem(){
                    Image(systemName: "graduationcap.circle")
                    Text("Noten")
                }
                .tag(3)
            
            
            }

        
        .accentColor(.blue)
        
        
    }
    
    
}
