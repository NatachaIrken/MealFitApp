//
//  HomeView.swift
//  MealFitApp
//
//  Created by Viki on 12-05-25.
//

import SwiftUI

struct HomeView: View {
    var userName: String
    
    var body: some View {
        List {
            Section(header: Text("Hola, \(userName)").font(.headline)) {
                NavigationLink("🍽️ Ver comidas", value: AppDestination.meals)
                NavigationLink("📊 Ver progreso", value: AppDestination.progress)
                NavigationLink("📝 Notas del día", value: AppDestination.notes)
            }
            
            Section(header: Text("Opciones")) {
                NavigationLink("⚙️ Configuración", value: AppDestination.settings)
            }
        }
        .navigationTitle("Inicio")
        .navigationBarBackButtonHidden()
    }
}
