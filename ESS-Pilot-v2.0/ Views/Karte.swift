//
//  Karte.swift
//  ESS-Pilot-v2.0
//
//  Created by David Schmeißer on 11.10.22.
//

import SwiftUI

struct Karte: View {
    var body: some View {

        //Liegt auf Eis, RNK lässt sich Zeit. 
            
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
                
                
                
                
                
            } // ZStack 2.0 Ende.
        } //ZStack 1.0 Ende.
          
    }
}






struct Fehlzeiten_Previews: PreviewProvider {
    static var previews: some View {
        Karte()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}







