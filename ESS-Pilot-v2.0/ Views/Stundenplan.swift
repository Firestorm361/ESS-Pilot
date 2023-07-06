//
//  Stundenplan.swift
//  ESS-Pilot-v2.0
//
//  Created by David Schmeißer on 11.10.22.
//


import UIKit
import SwiftUI
import WebKit

class WebViewContainer {
    static let shared = WebViewContainer()
    let webView: WKWebView = WKWebView()
}

struct Stundenplan: View {
    
struct CustomColor {
            
    static let superGrau = Color("superGrau")
            
        }
    
    var body: some View {
        NavigationView {
            StundenplanView(request: URLRequest(url: URL(string: "https://tritone.webuntis.com/timetable-students-my/2023-07-01")!))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct StundenplanView: UIViewRepresentable {
    let request: URLRequest

    func makeUIView(context: Context) -> WKWebView {
        let webView = WebViewContainer.shared.webView
        if webView.url == nil {
            webView.load(request)
        }
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        // Keine Änderungen erforderlich, da die URL beim Laden gesetzt wird
    }
}






/* struct StdSubject: Identifiable {
    let id = UUID()
    var name: String
    var teacher: String
    var room: String
}

struct TimetableCellView: View {
    var subject: StdSubject
    
    var body: some View {
        VStack(alignment: .center, spacing: 4) { // Zentrierte Ausrichtung
            Text(subject.name)
                .font(.system(size: 12)) // Schriftgröße angepasst
                .multilineTextAlignment(.center) // Zentrierte Ausrichtung
            Text(subject.teacher) // Nur den Namen der Lehrkraft anzeigen
                .font(.system(size: 10)) // Schriftgröße angepasst
            Text(subject.room) // Nur den Namen des Raums anzeigen
                .font(.system(size: 10)) // Schriftgröße angepasst
        }
        .padding()
    }
}

struct Stundenplan: View {
    @State private var subjects: [[StdSubject?]] = Array(repeating: Array(repeating: nil, count: 5), count: 10)
    private let cellWidth: CGFloat = 200
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.horizontal) {
                VStack(spacing: 0) {
                    HStack(spacing: 0) {
                        Text("Stunden")
                            .frame(width: 80, height: 50)
                            .border(Color.gray)
                        
                        ForEach(0..<5) { index in
                            Text(getWeekday(for: index))
                                .frame(width: cellWidth, height: 50)
                                .border(Color.gray)
                        }
                    }
                    
                    ScrollView(.vertical) {
                        VStack(spacing: 0) {
                            ForEach(0..<10) { hour in
                                HStack(spacing: 0) {
                                    Text("\(hour + 1)")
                                        .frame(width: 80, height: 50)
                                        .border(Color.gray)
                                    
                                    ForEach(0..<5) { weekday in
                                        if let subject = subjects[hour][weekday] {
                                            Button(action: {
                                                showEditSubjectDialog(hour: hour, weekday: weekday)
                                            }) {
                                                TimetableCellView(subject: subject)
                                                    .frame(width: cellWidth, height: 50)
                                                    .border(Color.gray)
                                            }
                                        } else {
                                            Button(action: {
                                                showAddSubjectDialog(hour: hour, weekday: weekday)
                                            }) {
                                                Rectangle()
                                                    .frame(width: cellWidth, height: 50)
                                                    .border(Color.gray)
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: geometry.size.height - 200)
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .padding()
        }
        .frame(maxWidth: .infinity)
        .padding()
    }
    
    private func getWeekday(for index: Int) -> String {
        let weekdays = ["Montag", "Dienstag", "Mittwoch", "Donnerstag", "Freitag"]
        return weekdays[index]
    }
    
    private func showAddSubjectDialog(hour: Int, weekday: Int) {
        let emptySubject = StdSubject(name: "", teacher: "", room: "")
        var newSubject = emptySubject
        
        let dialog = UIAlertController(title: "Fach hinzufügen", message: nil, preferredStyle: .alert)
        
        dialog.addTextField { textField in
            textField.placeholder = "Name"
            textField.autocapitalizationType = .words
            textField.text = newSubject.name
        }
        
        dialog.addTextField { textField in
            textField.placeholder = "Lehrkraft"
            textField.autocapitalizationType = .words
            textField.text = newSubject.teacher
        }
        
        dialog.addTextField { textField in
            textField.placeholder = "Raum"
            textField.autocapitalizationType = .words
            textField.text = newSubject.room
        }
        
        dialog.addAction(UIAlertAction(title: "Abbrechen", style: .cancel, handler: nil))
        
        dialog.addAction(UIAlertAction(title: "Hinzufügen", style: .default, handler: { _ in
            if let name = dialog.textFields?[0].text,
               let teacher = dialog.textFields?[1].text,
               let room = dialog.textFields?[2].text {
                newSubject.name = name
                newSubject.teacher = teacher
                newSubject.room = room
                
                subjects[hour][weekday] = newSubject
            }
        }))
        
        if let viewController = UIApplication.shared.windows.first?.rootViewController {
            viewController.present(dialog, animated: true, completion: nil)
        }
    }
    
    private func showEditSubjectDialog(hour: Int, weekday: Int) {
        guard let subject = subjects[hour][weekday] else {
            return
        }
        
        var editedSubject = subject
        
        let dialog = UIAlertController(title: "Fach bearbeiten", message: nil, preferredStyle: .alert)
        
        dialog.addTextField { textField in
            textField.placeholder = "Name"
            textField.autocapitalizationType = .words
            textField.text = editedSubject.name
        }
        
        dialog.addTextField { textField in
            textField.placeholder = "Lehrkraft"
            textField.autocapitalizationType = .words
            textField.text = editedSubject.teacher
        }
        
        dialog.addTextField { textField in
            textField.placeholder = "Raum"
            textField.autocapitalizationType = .words
            textField.text = editedSubject.room
        }
        
        dialog.addAction(UIAlertAction(title: "Abbrechen", style: .cancel, handler: nil))
        
        dialog.addAction(UIAlertAction(title: "Speichern", style: .default, handler: { _ in
            if let name = dialog.textFields?[0].text,
               let teacher = dialog.textFields?[1].text,
               let room = dialog.textFields?[2].text {
                editedSubject.name = name
                editedSubject.teacher = teacher
                editedSubject.room = room
                
                subjects[hour][weekday] = editedSubject
            }
        }))
        
        if let viewController = UIApplication.shared.windows.first?.rootViewController {
            viewController.present(dialog, animated: true, completion: nil)
        }
    }
}

struct Stundenplan_Previews: PreviewProvider {
    static var previews: some View {
        Stundenplan()
            .previewDevice(PreviewDevice(rawValue: "iPad Pro (11-inch)"))
            .preferredColorScheme(.light)
            .previewInterfaceOrientation(.landscapeLeft)
    }
} */









// .previewInterfaceOrientation(.landscapeLeft)
