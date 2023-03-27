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
        var body: some View {
            
        
        ZStack (alignment: .top){ //ZStack 1 Start
            Color.black
                .brightness(0.05)
                .ignoresSafeArea()
            
            
            VStack (alignment: .center){//VStack 1 Start
                
                    
                HStack (alignment: .top) {//HStack 1 Start
                    
                        
                    Spacer()
                
                    
                    //Benachrichtigungen
                    Button(action: {
                        isPresented.toggle()
                    }) {
                        Image(systemName: "bell.fill")
                            .font(.system(size: 30.0))
                            .foregroundColor(.gray)
                            .padding()
                            .sheet(isPresented: $isPresented) {
                                Einstellungen_Zentrale()}}
                    
                    
                    //Einstellungen
                    Button(action: {
                        //Vaccant
                    }) {
                        Image(systemName: "gearshape.fill")
                            .font(.system(size: 30.0))
                            .foregroundColor(.gray)
                            .padding()}
                    
                    
            } //HStack 1 Ende
                    
                    
        } //VStack 1 Ende
            
    
            
            ZStack { //ZStack Start 2.0
                
    
                Group{//Group Kopfzeile Start
                
                    
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

                
            }//Group-Kopfzeile Ende.
                
                
                Group{//Group Buttons Start
                    

                    //Button der den Ferienkalender Öffnet lol.
                    Button(action: {
                        print("Test Erfolgt")})
                    {Text("Ferienkalender") }
                        .frame(width: 100, height: 56)
                        .font(.system(size: 10.5))
                        .padding()
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .position(x: 900, y: 100))
                        .background(Color.blue)
                        .cornerRadius(15)
                        .buttonStyle(PlainButtonStyle())
                        .position(x: 950, y: 190)
                    
                    
                    //Button der zu den News bzw. zum Schulnewsletter führt
                    Button(action: {
                        print("Test Erfolgt")})
                    {Text("News") }
                        .frame(width: 100, height: 56)
                        .font(.system(size: 10.5))
                        .padding()
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .position(x: 900, y: 100))
                        .background(Color.red)
                        .cornerRadius(15)
                        .buttonStyle(PlainButtonStyle())
                        .position(x: 1100, y: 190)
                    
                    
                    //Button um direkt zum Entschuldigungstool zu kommen, für Tage an denen DHL kommt :D
                    Button(action: {
                        self.isPresented2 = true})
                    {Text("Entschuldigungstool") }
                        .frame(width: 100, height: 56)
                        .font(.system(size: 10.2))
                        .padding()
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .position(x: 900, y: 100))
                        .background(Color.green)
                        .cornerRadius(15)
                        .buttonStyle(PlainButtonStyle())
                        .position(x: 950, y: 300)
                        .sheet(isPresented: $isPresented2) {
                            Entschuldigungstool()}
                    
                          
                    //Button fürs Fehlzeiten Menü, evtl lustiges gif für Fehlzeitenlose?
                    Button(action: {
                        print("Test Erfolgt")})
                    {Text("Fehlzeiten") }
                        .frame(width: 100, height: 56)
                        .font(.system(size: 10.5))
                        .padding()
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .position(x: 900, y: 100))
                        .background(Color.yellow)
                        .cornerRadius(15)
                        .buttonStyle(PlainButtonStyle())
                        .position(x: 1100, y: 300)
                    
                } //Group Buttons Ende
                
            } // ZStack Ende 2.0
                
                
                
                ZStack { //ZStack Prüfungen u. Arbeiten
                    Group{ //Group Prüfungen u. Arbeiten
                        
                        //Rechteck
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(#colorLiteral(red: 0.10196078568696976, green: 0.10196078568696976, blue: 0.10196078568696976, alpha: 1)))
                            .frame(width: 382.5, height: 412)
                            .position(x: 220, y: 350)
                        
                        
                        //Rechteck Hellgrau
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(#colorLiteral(red: 0.2862745225429535, green: 0.2862745225429535, blue: 0.2862745225429535, alpha: 0.20000000298023224)))
                            .frame(width: 354.5, height: 40)
                            .position(x: 220, y: 225)
                        
                        
                        //Inhaltszeug
                        Text("TODO, wohoo").font(.system(size: 17, weight: .bold)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).tracking(-0.24).multilineTextAlignment(.center)
                            .position(x: 220, y: 350)
                        
                        
                        //Meine Arbeiten / Prüfungen
                        Text("Meine Arbeiten / Prüfungen").font(.system(size: 17, weight: .bold)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).tracking(-0.24)
                            .position(x: 220, y: 175)
                        
                    } //Group Prüfungen u. Arbeiten Ende
                } //ZStack Prüfungen u. Arbeiten Ende
                
            
                
                ZStack {//ZStack Termine / Hausaufgaben
                    Group{ //Group Termine / Hausaufgaben
                        
                        //Rechteck
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(#colorLiteral(red: 0.10196078568696976, green: 0.10196078568696976, blue: 0.10196078568696976, alpha: 1)))
                            .frame(width: 382.5, height: 412)
                            .position(x: 647, y: 350)
                        
                        
                        //Rechteck Hellgrau
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(#colorLiteral(red: 0.2862745225429535, green: 0.2862745225429535, blue: 0.2862745225429535, alpha: 0.20000000298023224)))
                            .frame(width: 354.5, height: 40)
                            .position(x: 647, y: 225)
                        
                        
                        //Inhaltszeug
                        Text("TODO, wohoo").font(.system(size: 17, weight: .bold)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).tracking(-0.24).multilineTextAlignment(.center)
                            .position(x: 647, y: 350)
                        
                        
                        //Meine Termine / Hausaufgaben
                        Text("Meine Termine / Hausaufgaben").font(.system(size: 17, weight: .bold)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).tracking(-0.24)
                            .position(x: 647, y: 175)
                        
                    } //Group Termine / Hausaufgaben Ende
                } //ZStack Termine / Hausaufgaben Ende
                
                
                
                ZStack { //ZStack Noten Diagramm
                    Group { //Group Noten Diagramm
                        
                        //CurrentNotesStats
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(#colorLiteral(red: 0.10196078568696976, green: 0.10196078568696976, blue: 0.10196078568696976, alpha: 1)))
                            .frame(width: 285, height: 185)
                            .position(x: 1025, y: 460)
                        
                    } //Group Noten Diagramm Ende
                } //ZStack Noten Diagramm Ende
            } //ZStack 1 Ende
        } // Var-Ende
    }  //Struct-Ende
    
    
    
    struct Zentrale_Previews: PreviewProvider {
        static var previews: some View {
            Zentrale()
                .previewInterfaceOrientation(.landscapeLeft)
        }
    }



    //Sub-Menü Benachrichtigungen start
    
  
    struct Einstellungen_Zentrale: View {
        @State private var selectedDays = Set<Weekday>()
        @State private var notificationTime = Date()
        @State private var isConfigured = false
        
        enum Weekday: String, CaseIterable {
            case sunday, monday, tuesday, wednesday, thursday, friday, saturday
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

    
//Sub-Menü Benachrichtigungen ende.





//Entschuldigungstool Start

    
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


//Entschuldigungstool Ende
