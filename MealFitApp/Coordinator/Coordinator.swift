//
//  Coordinator.swift
//  MealFitApp
//
//  Created by Viki on 12-05-25.
//
import SwiftUI

enum AppDestination: Hashable {
    case home(String)
    case meals
    case progress
    case notes
    case settings
}

class MealCoordinator: ObservableObject {
    @Published var navigationPath = NavigationPath()
    
    func navigate(to destination: AppDestination) {
        navigationPath.append(destination)
    }
    
    func goToHome(userName: String) {
        navigationPath.append(AppDestination.home(userName))
    }

    func goBack() {
        navigationPath.removeLast()
    }
    
    func reset() {
        navigationPath = NavigationPath()
    }
}
