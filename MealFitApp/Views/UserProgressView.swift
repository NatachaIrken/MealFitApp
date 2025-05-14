//
//  ProgressView.swift
//  MealFitApp
//
//  Created by Viki on 14-05-25.
//

import SwiftUI

struct UserProgressView: View {
    @ObservedObject var coordinator: MealCoordinator
    @ObservedObject var viewModel: MealViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            Text("📈 Tu progreso")
                .font(.title)
                .bold()
            
            VStack {
                Text("Total de comidas registradas:")
                    .font(.headline)
                Text("\(viewModel.totalMeals)")
                    .font(.largeTitle)
                    .foregroundColor(.purple)
            }
            
            Spacer()
            
            Button("Volver al inicio") {
                coordinator.goToHome(userName: "👋")
            }
            .padding()
            .background(Color.purple.opacity(0.1))
            .cornerRadius(10)
        }
        .padding()
        .navigationTitle("Tu Progreso")
    }
}
