//
//  MealsModel.swift
//  MealFitApp
//
//  Created by Viki on 12-05-25.
//

import Foundation

struct Meal: Identifiable, Hashable, Codable {
    let id: UUID
    var name: String
    var time: String
    
    init(id: UUID = UUID(), name: String, time: String) {
        self.id = id
        self.name = name
        self.time = time
    }
}

enum MealTimes: String, CaseIterable, Hashable {
    case desayuno
    case almuerzo
    case once
    case snack
    case cena
}
