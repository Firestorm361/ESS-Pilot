//
//  ContentView.swift
//  ESS-Pilot-v2.0
//
//  Created by Dave on 11.10.22.
//

import SwiftUI

struct ContentView: View {
    
@State var selection = 3
    
    init() {
        UITabBar.appearance().backgroundColor = .black}

    
    var body: some View {


        
        TabView(selection:$selection) {
            
            
            
            Stundenplan()
                .tabItem(){
                    Image(systemName: "clock.circle")
                    Text("Stundenplan")
                }
                .tag(1)
            
            
            Karte()
                .tabItem(){
                    Image(systemName: "map.circle")
                    Text("Karte")
                }
                .tag(2)
            
            
            Zentrale()
                .tabItem(){
                    Image(systemName: "books.vertical.circle")
                    Text("Zentrale")
                }
                .tag(3)
            
            
            Noten()
                .tabItem(){
                    Image(systemName: "graduationcap.circle")
                    Text("Noten")
                }
                .tag(4)
            
            
            TestingStuff()
                .tabItem(){
                    Image(systemName: "gear.circle")
                    Text("N/A")
                }
                .tag(5)
            
        }
        
 
        .accentColor(.blue)
        
        
    }
    
    
}
