//
//  ContentView.swift
//  ESS-Pilot-v2.0
//
//  Created by Dave on 11.10.22.
//

import SwiftUI 

struct ContentView: View {
    
    init() {
        UITabBar.appearance().backgroundColor = .black
    }
    
    var body: some View {
   
        TabView {
            
            
            
            Stundenplan()
                .tabItem(){
                    Image(systemName: "clock.circle")
                    Text("Stundenplan")
                }
            
            
            Karte()
                .tabItem(){
                    Image(systemName: "map.circle")
                    Text("Karte")
                }
            
            
            Zentrale()
                .tabItem(){
                    Image(systemName: "books.vertical.circle")
                    Text("Zentrale")
                }
            
            
            Noten()
                .tabItem(){
                    Image(systemName: "graduationcap.circle")
                    Text("Noten")
                }
            
            
            Modularer_Slot()
                .tabItem(){
                    Image(systemName: "gear.circle")
                    Text("N/A")
                }
            
        }
        
        .accentColor(.blue)
        
        
    }
    
    
}
