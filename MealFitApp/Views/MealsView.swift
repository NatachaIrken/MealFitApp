//
//  Untitled.swift
//  MealFitApp
//
//  Created by Viki on 12-05-25.
//

import SwiftUI

struct MealsView: View {
    @ObservedObject var viewModel: MealViewModel 
    @ObservedObject var coordinator: MealCoordinator
    
    var body: some View {
        VStack {
            HStack {
                TextField("¿Qué comiste?", text: $viewModel.newMealName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Menu {
                    ForEach(viewModel.mealTimes, id: \.self) { time in
                        Button(time.rawValue.capitalized) {
                            viewModel.selectedTime = time
                        }
                    }
                } label: {
                    Text(viewModel.selectedTime.rawValue.capitalized)
                        .padding(6)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
                }
                
                Button(action: viewModel.adMeal) {
                    Image(systemName: "plus.circle.fill")
                        .font(.title)
                        .foregroundColor(.green)
                }
            }
            .padding()
            
            List {
                ForEach(viewModel.meals) { meal in
                    HStack {
                        Text(meal.name)
                        Spacer()
                        Text(meal.time)
                            .foregroundColor(.secondary)
                    }
                }
                .onDelete(perform: viewModel.deleteMeal)
            }
        }
        .navigationTitle("Tus Comidas")
        
        List {
            Section(header: Text("Visita:")) {
                NavigationLink("Tu progreso", value: AppDestination.progress)
                NavigationLink("Notas del día", value: AppDestination.notes)
            }
        }
    }
}
