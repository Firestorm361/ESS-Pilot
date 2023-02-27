//
//  TestingStuff3.swift
//  ESS-Pilot-v2.0
//
//  Created by David Schmeißer on 22.02.23.
//

import SwiftUI

struct TestingStuff3: View {
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
                    Text("An welchen Tagen sollen Push-Benachrichtigungen gesendet werden?")
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
            .padding(.top, 20)
            
            Spacer()
            
            HStack(spacing: 20) {
                Button(action: {
                    UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
                    selectedDays.removeAll()
                    notificationTime = Date()
                    isConfigured = false
                }) {
                    Text("Zurücksetzen")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .cornerRadius(10)
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
                    }
                    .disabled(selectedDays.isEmpty)
                    .padding(.horizontal)
                }
                .padding(.bottom, 20)
            }
            .navigationBarTitle("Push-Benachrichtigungen")
            .alert(isPresented: $isConfigured) {
                Alert(title: Text("Einstellungen gespeichert"), message: nil, dismissButton: .default(Text("OK")))
            }
        }
    }




