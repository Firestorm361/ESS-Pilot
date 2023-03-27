//
//  Stundenplan.swift
//  ESS-Pilot-v2.0
//
//  Created by David Schmeißer on 11.10.22.
//

import SwiftUI

struct Stundenplan: View {
    var body: some View {
  
        
        //Wenn Untis API fehlschlägt, manuelle implementation des Stundenplans -> App wirs größetenteils obsolete. 
            
            ZStack {
                
                Image(systemName: "note.text")
                    .foregroundColor(Color.green)
                    .font(.system(size: 100))
            }
            
        
        
    }
        }
    


struct Stundenplan_Previews: PreviewProvider {
    static var previews: some View {
        Stundenplan()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}




