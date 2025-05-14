//
//  SettingsView.swift
//  MealFitApp
//
//  Created by Viki on 12-05-25.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var coordinator: MealCoordinator

    var body: some View {
        Form {
            Section {
                Button("Cerrar sesión") {
                    coordinator.reset() 
                }
                .foregroundColor(.red)
            }
        }
        .navigationTitle("Configuración")
    }
}
