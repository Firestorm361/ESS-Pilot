//
//  Modularer Slot.swift
//  ESS-Pilot-v2.0
//
//  Created by David Schmeißer on 21.11.22.
//

import SwiftUI
import UserNotifications

struct Modularer_Slot: View {
    var body: some View {
        VStack {
            
            Button("N/A") {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    
                    if success {
                            print("Supi Dupi")
                        
                    } else if let error = error {
                        print(error.localizedDescription)
                        
                    }
                }
            }
            
            
            
            
            
            
            Button("Test") {
                let content = UNMutableNotificationContent()
                content.title = "Lade dein iPad"
                content.subtitle = "Du brauchst morgen Strom!"
                content.sound = UNNotificationSound.default
                
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                
                UNUserNotificationCenter.current().add(request) 
            }
            
            
            
            
            //Hier super mega advanced Broadcast System einfügen 
            
            
            
            
            
            
        }
    }
}






struct Modularer_Slot_Previews: PreviewProvider {
    static var previews: some View {
        Modularer_Slot()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}


