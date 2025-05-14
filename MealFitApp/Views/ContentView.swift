//
//  ContentView.swift
//  MealFitApp
//
//  Created by Viki on 12-05-25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var coordinator = MealCoordinator()
    @StateObject private var viewModel = MealViewModel()
    @State var name: String = ""

    var body: some View {
        NavigationStack(path: $coordinator.navigationPath) {
            VStack(spacing: 20) {
                TextField("Nombre", text: $name)
                    .padding(10)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.gray, lineWidth: 2)
                    }
                    .padding(.horizontal, 24)

                Button {
                    coordinator.goToHome(userName: name)
                } label: {
                        Text("Ingresar")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(
                            LinearGradient(colors: [.pink, .purple], startPoint: .leading, endPoint: .trailing)
                        )
                        .cornerRadius(10)
                        .opacity(name.isEmpty ? 0.5 : 1.0)
                        .disabled(name.isEmpty)
                }
                .padding(.horizontal, 24)
            }
            .navigationDestination(for: AppDestination.self) { destination in
                switch destination {
                case .meals:
                    MealsView(viewModel: viewModel, coordinator: coordinator)
                case .home(let userName):
                    HomeView(userName: userName)
                case .progress:
                    UserProgressView(coordinator: coordinator, viewModel: viewModel)
                case .notes:
                    NotesView(coordinator: coordinator, viewModel: viewModel)

                case .settings:
                    SettingsView(coordinator: coordinator)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
