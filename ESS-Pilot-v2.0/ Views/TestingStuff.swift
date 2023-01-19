//
//  TestingStuff.swift
//  ESS-Pilot-v2.0
//
//  Created by David Schmeißer on 04.12.22.
//

import SwiftUI

struct TestingStuff: View {
    var body: some View {
        
        
        ZStack{
            Rectangle()
                .fill(Color.red)
            
            HStack (){
                Rectangle()
                    .fill(Color.blue)
                    .frame(width: 100, height: 100)
                
                
                
                
            }
            
            
            
        }
        
    }
    
    struct TestingStuff_Previews: PreviewProvider {
        static var previews: some View {
            TestingStuff()
        }
    }
    
    
}
