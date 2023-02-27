//
//  Noten.swift
//  ESS-Pilot-v2.0
//
//  Created by David Schmeißer on 11.10.22.
//

import SwiftUI

struct Noten: View {
    @State private var navPath = NavigationPath()
    var body: some View {
        
            
        ZStack (alignment: .top){ //Mutter ZStack Start
            Color.black
                .brightness(0.05)
                .ignoresSafeArea()
            
            VStack (alignment: .center){
                
                HStack (alignment: .top) {
                    
                    Spacer()
                    
                    
                    //Benachrichtigungen
                    Button(action: {
                        //Place the functionality
                    }) {
                        Image(systemName: "bell.fill")
                            .font(.system(size: 30.0))
                            .foregroundColor(.gray)
                            .padding()
                    }
                    
                    
                    //Einstellungen
                    Button(action: {
                        //Place the functionality
                    }) {
                        Image(systemName: "gearshape.fill")
                            .font(.system(size: 30.0))
                            .foregroundColor(.gray)
                            .padding()
                    }
                    
                } //HStack
                
            } //VStack
            
            
            
            ZStack { //ZStack Start 2.0
                
                //Kopfzeilen-Label Start
                Label("Person", systemImage: "person.fill")
                    .labelStyle(IconOnlyLabelStyle())
                    .font(.system(size: 45.0))
                    .foregroundColor(Color.gray)
                    .position(x: 40,y: 35)
                
                
                
                Label("Guten Tag,", systemImage: "person.fill")
                    .labelStyle(TitleOnlyLabelStyle())
                    .font(.system(size: 12.5))
                    .foregroundColor(Color.white)
                    .position(x: 115,y: 24)
                
                
                
                Label("Gast", systemImage: "person.fill")
                    .labelStyle(TitleOnlyLabelStyle())
                    .font(.system(size: 22.5))
                    .foregroundColor(Color.white)
                    .position(x: 105,y: 46)
                
                
                
                Label("Nächste Stunde • Schule aus", systemImage: "person.fill")
                    .labelStyle(TitleOnlyLabelStyle())
                    .font(.system(size: 22.5))
                    .foregroundColor(Color.white)
                    .position(x: 600,y: 30)
                
                
                
                Label("Wir wünschen dir einen schönen Tag!", systemImage: "person.fill")
                    .labelStyle(TitleOnlyLabelStyle())
                    .font(.system(size: 12.5))
                    .foregroundColor(Color.black)
                    .brightness(0.2)
                    .position(x: 600,y: 51)
                
    
                
                Divider()
                    .frame(width: 1170)
                    .overlay(.gray)
                    .position(x: 600, y: 90)
                //Kopfzeile Ende.
                
                


                    NavigationStack(path: $navPath) {
                        Button("Jump to random") {
                            navPath.append(Int.random(in: 1..<50))
                        }

                        List(1..<50) { i in
                            NavigationLink(value: "Row \(i)") {
                                Label("Row \(i)", systemImage: "\(i).circle")
                            }
                        }
                        .navigationDestination(for: Int.self) { i in
                            Text("Int Detail \(i)")
                        }
                        .navigationDestination(for: String.self) { i in
                            Text("String Detail \(i)")
                        }
                        .navigationTitle("Navigation")
                    }
                
                
                
            } // ZStack 2.0 Ende.
        } //ZStack 1.0 Ende.
        
        //Hochexperimentelles Zeug. 
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
    }
}

struct Noten_Previews: PreviewProvider {
    static var previews: some View {
        Noten()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
