//
//  Stundenplan.swift
//  ESS-Pilot-v2.0
//
//  Created by David Schmeißer on 11.10.22.
//

import SwiftUI

struct Stundenplan: View {
    var body: some View {
        ZStack {
            Color.black
                .brightness(0.05)
                .ignoresSafeArea()
            
            ZStack {
                
                
                Label("SwiftUI Tutorials", systemImage: "person.fill")
                    .labelStyle(IconOnlyLabelStyle())
                    .font(.system(size: 45.0))
                    .foregroundColor(Color.gray)
                    .position(x: 75,y: 50)
                
                
                Label("Guten Tag,", systemImage: "person.fill")
                    .labelStyle(TitleOnlyLabelStyle())
                    .font(.system(size: 12.5))
                    .foregroundColor(Color.white)
                    .position(x: 145,y: 39)
                
                
                Label("Gast", systemImage: "person.fill")
                    .labelStyle(TitleOnlyLabelStyle())
                    .font(.system(size: 22.5))
                    .foregroundColor(Color.white)
                    .position(x: 135,y: 60)
                
                
                Label("Nächste Stunde • Schule aus", systemImage: "person.fill")
                    .labelStyle(TitleOnlyLabelStyle())
                    .font(.system(size: 22.5))
                    .foregroundColor(Color.white)
                    .position(x: 600,y: 45)
                
                
                Label("Wir wünschen dir einen schönen Tag!", systemImage: "person.fill")
                    .labelStyle(TitleOnlyLabelStyle())
                    .font(.system(size: 12.5))
                    .foregroundColor(Color.black)
                    .brightness(0.2)
                    .position(x: 600,y: 66)
                
                
                
                
                Button(action: {
                    //Place the functionality
                }) {
                    Image(systemName: "bell.fill")
                        .font(.system(size: 25))
                        .foregroundColor(.gray)
                        .position(x: 1025,y: 66)
                        .buttonStyle(BorderlessButtonStyle())
                }
                
                
                Button(action: {
                    //Place the functionality
                }) {
                    Image(systemName: "newspaper.fill")
                        .font(.system(size: 25))
                        .foregroundColor(.gray)
                        .position(x: 1075,y: 66)
                    
                    
                }
                
                
                Button(action: {
                    //Place the functionality
                }) {
                    Image(systemName: "gearshape.fill")
                        .font(.system(size: 25))
                        .foregroundColor(.gray)
                        .position(x: 1125,y: 66)
                    
                    
                    
                }
                
                Divider()
                    .frame(width: 1100)
                    .overlay(.gray)
                    .position(x: 600, y: 100)
                
            }
            
            ZStack {
                
                Image(systemName: "note.text")
                    .foregroundColor(Color.green)
                    .font(.system(size: 100))
            }
            
        }
        
    }
        }
    


struct Stundenplan_Previews: PreviewProvider {
    static var previews: some View {
        Stundenplan()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}




