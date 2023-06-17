//
//  Noten.swift
//  ESS-Pilot-v2.0
//
//  Created by David Schmeißer on 11.10.22.
//

import SwiftUI

struct Grade: Identifiable {
    var id = UUID()
    var value: Double
    var category: String
}

struct Subject: Identifiable {
    var id = UUID()
    var name: String
    var grades: [Grade]
    var categories: [String: Double]  // Dictionary holding category and its weight
    var average: Double {
        let totalWeight = grades.reduce(0) { $0 + categories[$1.category, default: 1] }
        let totalValue = grades.reduce(0) { $0 + $1.value * categories[$1.category, default: 1] }
        return totalWeight > 0 ? totalValue / totalWeight : 0
    }
}

struct Noten: View {
    @State private var subjects: [Subject] = []
    @State private var newSubjectName: String = ""
    @State private var showingAddSubject: Bool = false

    var body: some View {
        NavigationView {
            List {
                ForEach(subjects) { subject in
                    NavigationLink(destination: SubjectView(subject: $subjects[subjects.firstIndex(where: { $0.id == subject.id })!])) {
                        VStack(alignment: .leading) {
                            Text(subject.name)
                            Text("Durchschnitt: \(subject.average, specifier: "%.2f")")
                        }
                    }
                }
                .onDelete(perform: deleteSubject)
            }
            .navigationBarTitle("Fächer")
            .navigationBarItems(leading: EditButton(), trailing: Button(action: { showingAddSubject = true }) {
                Image(systemName: "plus")
            })
            .padding([.leading, .trailing])
        }
        .sheet(isPresented: $showingAddSubject) {
            VStack {
                Spacer()
                Text("Neues Fach hinzufügen")
                TextField("Fachname", text: $newSubjectName)
                    .padding()
                    .border(Color.gray, width: 0.5)
                Button("Hinzufügen") {
                    withAnimation {
                        subjects.append(Subject(name: newSubjectName, grades: [], categories: [:]))
                        newSubjectName = ""
                        showingAddSubject = false
                    }
                }
                Spacer()
            }
            .padding()
        }
    }

    private func deleteSubject(at offsets: IndexSet) {
        withAnimation {
            subjects.remove(atOffsets: offsets)
        }
    }
}

struct SubjectView: View {
    @Binding var subject: Subject
    @State private var newCategoryName: String = ""
    @State private var newCategoryWeight: String = ""
    @State private var newGradeValue: String = ""
    @State private var selectedGradeCategory: String = ""
    @State private var showingAddCategory: Bool = false
    @State private var showingAddGrade: Bool = false

    var body: some View {
        List {
            ForEach(subject.grades) { grade in
                VStack(alignment: .leading) {
                    Text(grade.category)
                    Text("Note: \(grade.value, specifier: "%.2f")")
                }
            }
            .onDelete(perform: deleteGrade)
        }
        .navigationBarTitle(subject.name)
        .navigationBarItems(leading: EditButton(), trailing: HStack {
            Button(action: { showingAddCategory = true }) {
                Image(systemName: "plus")
            }
            Button(action: { showingAddGrade = true }) {
                Image(systemName: "plus.circle")
            }
        })
        .sheet(isPresented: $showingAddCategory) {
            VStack {
                Spacer()
                Text("Neue Kategorie hinzufügen")
                TextField("Kategoriename", text: $newCategoryName)
                    .padding()
                    .border(Color.gray, width: 0.5)
                TextField("Kategoriegewicht", text: $newCategoryWeight)
                    .padding()
                    .border(Color.gray, width: 0.5)
                Button("Hinzufügen") {
                    if let newCategoryWeight = Double(newCategoryWeight) {
                        withAnimation {
                            subject.categories[newCategoryName] = newCategoryWeight
                            newCategoryName = ""
                            self.newCategoryWeight = ""
                            showingAddCategory = false
                        }
                    }
                }
                Spacer()
            }
            .padding()
        }
        .sheet(isPresented: $showingAddGrade) {
            VStack {
                Spacer()
                Text("Neue Note hinzufügen")
                TextField("Note", text: $newGradeValue)
                    .padding()
                    .border(Color.gray, width: 0.5)
                Picker("Kategorie", selection: $selectedGradeCategory) {
                    ForEach(Array(subject.categories.keys), id: \.self) { category in
                        Text(category)
                    }
                }
                Button("Hinzufügen") {
                    if let gradeValue = Double(newGradeValue) {
                        withAnimation {
                            subject.grades.append(Grade(value: gradeValue, category: selectedGradeCategory))
                            newGradeValue = ""
                            showingAddGrade = false
                        }
                    }
                }
                Spacer()
            }
            .padding()
        }
    }

    private func deleteGrade(at offsets: IndexSet) {
        withAnimation {
            subject.grades.remove(atOffsets: offsets)
        }
    }
}

