//
//  MealViewModel.swift
//  FetchTakeHome
//
//  Created by Ethan Perkins on 8/15/24.
//

import SwiftUI

class MealViewModel: ObservableObject {

    let networkManager = MealNetworkManager()

    @Published var meals: [Meal] = []
    @Published var meal: Meal?
    @Published var selectedMeal: Meal?

    @Published var ingredients: [String] = []
    @Published var measurements: [String] = []

    func fetchMeals() {
        Task {
            do {
                meals = try await networkManager.fetchMeals()
            } catch {
                if let error = error as? MealError {
                    switch error {
                    case .invalidURL:
                        print("Invalid URL")
                    case .invalidResponse:
                        print("Invalid Response")
                    case .invalidData:
                        print("Invalid Data")
                    }
                }
            }
        }
    }

    func fetchMealsById(id: String) {
        Task {
            do {
                if let id = selectedMeal?.id {
                    meal = try await networkManager.fetchMealById(id)
                }
            } catch {
                if let error = error as? MealError {
                    switch error {
                    case .invalidURL:
                        print("Invalid URL")
                    case .invalidResponse:
                        print("Invalid Response")
                    case .invalidData:
                        print("Invalid Data")
                    }
                }
            }
        }
    }
}
