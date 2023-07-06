//
//  Zentrale.swift
//  ESS-Pilot-v2.0
//
//  Created by David Schmeißer on 11.10.22.
//

import SwiftUI
import WebKit
import UserNotifications


struct Zentrale: View {
    @State private var isPresented = false
    @State private var isPresented2 = false
    @State private var isPresented3 = false
    
    struct CustomColor {
        
        static let superGrau = Color("superGrau")
        
    }
    
        let columns = [
            GridItem(.flexible(), spacing: 15),
            GridItem(.flexible(), spacing: 15)
        ]
        
        var body: some View {
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Label("Person", systemImage: "person.fill")
                            .labelStyle(IconOnlyLabelStyle())
                            .font(.system(size: 45.0))
                            .foregroundColor(Color.gray)
                    }
                    
                    VStack(alignment: .leading) {
                        
                        Label("Guten Tag,", systemImage: "person.fill")
                            .labelStyle(TitleOnlyLabelStyle())
                            .font(.system(size: 12.5))
                            .foregroundColor(Color.white)
                        
    
                        Label("Gast", systemImage: "person.fill")
                            .labelStyle(TitleOnlyLabelStyle())
                            .font(.system(size: 22.5))
                            .foregroundColor(Color.white)
                    }
                    
                    
                    Spacer()
                    
                    
                    VStack(alignment: .leading) {
                        Label("Nächste Stunde • Schule aus", systemImage: "person.fill")
                            .labelStyle(TitleOnlyLabelStyle())
                            .font(.system(size: 22.5))
                            .foregroundColor(Color.white)
                        
                        
                        Label("Wir wünschen dir einen schönen Tag!", systemImage: "person.fill")
                            .labelStyle(TitleOnlyLabelStyle())
                            .font(.system(size: 12.5))
                            .foregroundColor(Color.white)
                    }
                    
                    
                    Spacer()
                   
                    
                    HStack() { //Benachrichtigungen
                        Button(action: {
                            isPresented.toggle()
                        }) {
                            Image(systemName: "bell.fill")
                                .font(.system(size: 25.0))
                                .foregroundColor(.gray)
                                .sheet(isPresented: $isPresented) {
                                    Einstellungen_Zentrale()
                            }
                        }
                    }
                }
                .padding()
                
                
                Divider()
                    .overlay(Color.gray)
                    .frame(minHeight: 11)
                
                
                HStack(alignment: .top, spacing: 40) {
                    VStack {
                        ZStack{
                            RoundedRectangle(cornerRadius: 15)
                                .fill(CustomColor.superGrau)
                                .frame(width: 325, height: 365)
                            
                            
                            Image(systemName: "plus.app")
                                .font(.system(size: 20.0))
                                .foregroundColor(Color.white)
                                .tracking(-0.24)
                                .position(x: 300, y: 40)
                                
                            
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.gray)
                                .frame(width: 300, height: 10)
                                .padding()
                                .position(x: 160, y: 65)
                            
  
                            Text("Meine Arbeiten / Pfüfungen")
                                .font(.system(size: 17, weight: .bold))
                                .foregroundColor(Color.white)
                                .tracking(-0.24)
                                .position(x: 160, y: 40)
                            

                            Text("Keine Arbeiten.")
                                .font(.system(size: 17, weight: .bold))
                                .foregroundColor(Color.white)
                                .tracking(-0.24)
                                .multilineTextAlignment(.center)
                                .position(x: 160, y: 200)
                        }
                    }
                    .padding()
                    
                  
                        VStack {
                            ZStack{
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(CustomColor.superGrau)
                                    .frame(width: 325, height: 365)
                                
                                
                                Image(systemName: "plus.app")
                                    .font(.system(size: 20.0))
                                    .foregroundColor(Color.white)
                                    .tracking(-0.24)
                                    .position(x: 300, y: 40)
                                

                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.gray)
                                    .frame(width: 300, height: 10)
                                    .padding()
                                    .position(x: 160, y: 65)

                                
                                Text("Meine Termine / Hausaufgaben")
                                    .font(.system(size: 17, weight:.bold))
                                    .foregroundColor(Color.white)
                                    .tracking(-0.24)
                                    .position(x: 160, y: 40)
   
                                
                                Text("Keine Hausaufgaben.")
                                    .font(.system(size: 17, weight:.bold))
                                    .foregroundColor(Color.white)
                                    .tracking(-0.24).multilineTextAlignment(.center)
                                    .position(x: 175, y: 200)
                        }
                    }
                    .padding()

                    
                    VStack(spacing: 0) {
                        LazyVGrid(columns: columns,alignment: .center, spacing: 10){
                           
                            
                            //Button um direkt zum Entschuldigungstool zu kommen, für Tage an denen DHL kommt :D
                            Button(action: {
                                self.isPresented2 = true
                            }) {
                                VStack(alignment: .leading, spacing: 5) {
                                    Image(systemName: "doc")
                                        .font(.system(size: 20))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    Text("Entschuldigungstool")
                                        .font(.system(size: 10.2))
                                        .lineLimit(1)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                .frame(width: 100, height: 56)
                                .padding()
                                .foregroundColor(.white)
                                .background(CustomColor.superGrau)
                                .cornerRadius(15)
                                .buttonStyle(PlainButtonStyle())
                                .sheet(isPresented: $isPresented2) {
                                    Entschuldigungstool()
                                }
                            }

                            
                                //Button der zu den News bzw. zum Schulnewsletter führt
                                Button(action: {
                                    print("Test Erfolgt")
                                    self.isPresented3 = true
                                }) {
                                    VStack(alignment: .leading, spacing: 5) {
                                        Image(systemName: "newspaper")
                                            .font(.system(size: 20))
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        Text("News")
                                            .font(.system(size: 10.5))
                                            .lineLimit(1)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                    }
                                    .frame(width: 100, height: 56)
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(CustomColor.superGrau)
                                    .cornerRadius(15)
                                    .buttonStyle(PlainButtonStyle())
                                    .sheet(isPresented: $isPresented3) {
                                        NewsView()
                                    }
                                }

                            
                            //Button der den Ferienkalender Öffnet lol.
                         Button(action: {
                                print("Test Erfolgt")
                            }) {
                                VStack(alignment: .leading, spacing: 5) { // Use VStack to align icon and text vertically to the left
                                    Image(systemName: "calendar.badge.exclamationmark")
                                        .font(.system(size: 20))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .foregroundColor(.white)
                                  
                                       
                                    Text("Ferienkalender")
                                        .font(.system(size: 10.5))
                                        .lineLimit(1) // Add line limit to prevent the text from overflowing
                                        .frame(maxWidth: .infinity, alignment: .leading) // Align text to the left
                                }
                                .frame(width: 100, height: 56)
                                .padding()
                                .foregroundColor(.white)
                                .background(CustomColor.superGrau)
                                .cornerRadius(15)
                                .buttonStyle(PlainButtonStyle())
                            }
                                     
                            
                                //Button fürs Fehlzeiten Menü, evtl lustiges gif für Fehlzeitenlose?
                                Button(action: {
                                    print("Test Erfolgt")
                                }) {
                                    VStack(alignment: .leading, spacing: 5) {
                                        Image(systemName: "clock.badge.xmark")
                                            .font(.system(size: 20))
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        Text("Fehlzeiten")
                                            .font(.system(size: 10.5))
                                            .lineLimit(1)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                    }
                                    .frame(width: 100, height: 56)
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(CustomColor.superGrau)
                                    .cornerRadius(15)
                                    .buttonStyle(PlainButtonStyle())
                                    }
                                }
                                .padding()
                        

                        RoundedRectangle(cornerRadius: 20)
                            .padding()
                            .foregroundColor(CustomColor.superGrau)
                            .frame(width: 310, height: 175)
                        
                        Text("Keine Noten verfügbar.")
                            .font(.system(size: 17, weight:.bold))
                            .foregroundColor(Color.white)
                            .tracking(-0.24).multilineTextAlignment(.center)
                            .position(x: 152.5, y: -92.5)
                        
                    }
                    .padding()
                    
                    
                }
                .padding()
                .frame(height: 460)
                Spacer()
                
                
            }
            .padding()
            .background(Color(red: 0.05, green: 0.05, blue: 0.05))
            
            
        }

    
    }
    

    struct Einstellungen_Zentrale: View {
        @State private var selectedDays = Set<Weekday>()
        @State private var notificationTime = Date()
        @State private var isConfigured = false
        
        enum Weekday: String, CaseIterable {
            case monday, tuesday, wednesday, thursday, friday, saturday, sunday
        }
        
        
        let timeFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            return formatter
        }()
        
        
        var body: some View {
            VStack {
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Text("Uhrzeit:")
                            .font(.title2)
                            .fontWeight(.semibold)
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                    
                    TextField("HH:mm", value: $notificationTime, formatter: timeFormatter)
                        .keyboardType(.numbersAndPunctuation)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(height: 50)
                        .padding(.horizontal)
                    
                    
                    Divider()
                        .padding(.horizontal)
                    
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("An welchen Tagen möchtest du Benachrichtigungen erhalten?")
                            .font(.title2)
                            .fontWeight(.semibold)

                        
                        ForEach(Weekday.allCases, id: \.self) { day in
                            Button(action: {
                                if selectedDays.contains(day) {
                                    selectedDays.remove(day)
                                } else {
                                    selectedDays.insert(day)
                                }
                            }) {
                                HStack {
                                    Text(day.rawValue.capitalized)
                                        .font(.headline)
                                        .foregroundColor(.primary)
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                    
                                    Image(systemName: selectedDays.contains(day) ? "checkmark.square.fill" : "square")
                                        .foregroundColor(selectedDays.contains(day) ? Color.blue : Color.secondary)
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                
                
                Spacer()
                
                
                HStack(spacing: 20) {
                    Button(action: {
                        selectedDays.removeAll()
                        notificationTime = Date()
                    }) {
                        Text("Zurücksetzen")
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.red)
                            .cornerRadius(10)
                            .position(x: 175, y: 160)
                    }
                    
                    
                    Button(action: {
                        let content = UNMutableNotificationContent()
                        content.title = "Erinnerung"
                        content.body = "Lade dein iPad auf, du wirst es Morgen brauchen :)"
                        content.sound = UNNotificationSound.default
                        
                        
                        let dateComponents = Calendar.current.dateComponents([.weekday, .hour, .minute], from: notificationTime)
                        
                        
                        for weekday in selectedDays {
                            var components = dateComponents
                            components.weekday = Weekday.allCases.firstIndex(of: weekday)! + 1
                            
                            let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: true)
                            
                            
                            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                            UNUserNotificationCenter.current().add(request)
                        }
                        
                        isConfigured = true
                    }) {
                        Text("Bestätigen")
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(selectedDays.isEmpty ? Color.gray : Color.green)
                            .cornerRadius(10)
                            .position(x: 175, y: 160)
                    }
                    .disabled(selectedDays.isEmpty)
                    .padding(.horizontal)
                    .padding(.bottom, 20)
                    
                    
                    Spacer()
                    
                    
                }
                .padding(.top, 20)
                .navigationBarTitle("Push-Benachrichtigungen")
                .alert(isPresented: $isConfigured) {
                    Alert(title: Text("Einstellungen gespeichert"), message: nil, dismissButton: .default(Text("OK")))
                }
            }
        }
    }


    struct Entschuldigungstool: View {
        var body: some View {
            NavigationView {
                WebView2(request: URLRequest(url: URL(string: "https://www.esss.de/entschuldigungstool")!))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
    
    
    struct WebView2: UIViewRepresentable {
        let request: URLRequest
        
        
        func makeUIView(context: Context) -> WKWebView {
            return WKWebView()
        }
        
        
        func updateUIView(_ uiView: WKWebView, context: Context) {
            uiView.load(request)
        }
    }


struct NewsView: View {
    var body: some View {
        NavigationView {
            WebView3(request: URLRequest(url: URL(string: "https://mailchi.mp/3ee801fba69d/newletter-test-17370815?e=167420e3f3")!))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}


struct WebView3: UIViewRepresentable {
    let request: URLRequest
    
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(request)
    }
}


   struct Zentrale_Previews: PreviewProvider {
    static var previews: some View {
        Zentrale()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
