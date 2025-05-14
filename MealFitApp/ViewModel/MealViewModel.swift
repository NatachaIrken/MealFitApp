//
//  ViewModel.swift
//  MealFitApp
//
//  Created by Viki on 12-05-25.
//

import SwiftUI

class MealViewModel: ObservableObject {
    @Published var meals: [Meal] = []
    @Published var newMealName: String = ""
    @Published var selectedTime: MealTimes = .desayuno
    @Published var notes: [String] = []
    @Published var newNote: String = ""
    
    private let mealsKey = "userMeals"
    private let notesKey = "userNotes"
    
    var totalMeals: Int {
        meals.count
    }
    
    init() {
        loadMeals()
        loadNotes()
    }
    
    func adMeal() {
        guard !newMealName.isEmpty else { return }
        let newMeal = Meal(name: newMealName, time: selectedTime.rawValue.capitalized)
        meals.append(newMeal)
        newMealName = ""
    }
    
    func deleteMeal(at offsets: IndexSet) {
        meals.remove(atOffsets: offsets)
    }
    
    func saveMeals() {
        if let encoded = try? JSONEncoder().encode(meals) {
            UserDefaults.standard.set(encoded, forKey: mealsKey)
        }
    }
    
    func loadMeals() {
        if let data = UserDefaults.standard.data(forKey: mealsKey),
           let decoded = try? JSONDecoder().decode([Meal].self, from: data) {
            meals = decoded
        }
    }
    
    func addNote() {
        guard !newNote.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return }
        notes.append(newNote)
        newNote = ""
        saveNotes()
    }
    
    func saveNotes() {
        UserDefaults.standard.set(notes, forKey: notesKey)
    }
    
    func deleteNote(at offsets: IndexSet) {
        notes.remove(atOffsets: offsets)
        saveNotes()
    }
    
    func loadNotes() {
        if let savedNotes = UserDefaults.standard.stringArray(forKey: notesKey) {
            notes = savedNotes
        }
    }
    
    var mealTimes: [MealTimes] {
        MealTimes.allCases
    }
}
