//
//  MealViewModel.swift
//  FetchTakeHome
//
//  Created by Ethan Perkins on 8/15/24.
//

import SwiftUI

// This is used to provide communication between the models and the views
@MainActor class MealViewModel: ObservableObject {

    let networkManager = MealNetworkManager()

    @Published var meals: [Meal] = []
    @Published var mealResponse: [MealDetailResponse] = []
    @Published var meal: Meal?
    @Published var mealDetails: MealDetail?
    @Published var selectedMeal: Meal?
    @Published var isShowingDetail: Bool = false

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

    func fetchMealDetails(id: String) {
        Task {
            do {
                mealResponse = try await networkManager.fetchMealDetails(id)
                let response = mealResponse.first

                    let ingredients = [
                        Ingredient(name: response?.ingredient1 ?? "", measurement: response?.measurement1 ?? ""),
                        Ingredient(name: response?.ingredient2 ?? "", measurement: response?.measurement2 ?? ""),
                        Ingredient(name: response?.ingredient3 ?? "", measurement: response?.measurement3 ?? ""),
                        Ingredient(name: response?.ingredient4 ?? "", measurement: response?.measurement4 ?? ""),
                        Ingredient(name: response?.ingredient5 ?? "", measurement: response?.measurement5 ?? ""),
                        Ingredient(name: response?.ingredient6 ?? "", measurement: response?.measurement6 ?? ""),
                        Ingredient(name: response?.ingredient7 ?? "", measurement: response?.measurement7 ?? ""),
                        Ingredient(name: response?.ingredient8 ?? "", measurement: response?.measurement8 ?? ""),
                        Ingredient(name: response?.ingredient9 ?? "", measurement: response?.measurement9 ?? ""),
                        Ingredient(name: response?.ingredient10 ?? "", measurement: response?.measurement10 ?? ""),
                        Ingredient(name: response?.ingredient11 ?? "", measurement: response?.measurement11 ?? ""),
                        Ingredient(name: response?.ingredient12 ?? "", measurement: response?.measurement12 ?? ""),
                        Ingredient(name: response?.ingredient13 ?? "", measurement: response?.measurement13 ?? ""),
                        Ingredient(name: response?.ingredient14 ?? "", measurement: response?.measurement14 ?? ""),
                        Ingredient(name: response?.ingredient15 ?? "", measurement: response?.measurement15 ?? ""),
                        Ingredient(name: response?.ingredient16 ?? "", measurement: response?.measurement16 ?? ""),
                        Ingredient(name: response?.ingredient17 ?? "", measurement: response?.measurement17 ?? ""),
                        Ingredient(name: response?.ingredient18 ?? "", measurement: response?.measurement18 ?? ""),
                        Ingredient(name: response?.ingredient19 ?? "", measurement: response?.measurement19 ?? ""),
                        Ingredient(name: response?.ingredient20 ?? "", measurement: response?.measurement20 ?? ""),
                    ]

                    let filteredIngredients = ingredients.filter { ingredient in
                        !ingredient.name.isEmpty && !ingredient.measurement.isEmpty
                    }

                if let name = response?.mealName, let instructions = response?.instructions, let category = response?.category {
                    let filteredMealDetails = MealDetail(
                        name: name,
                        instructions: instructions, 
                        category: category,
                        ingredients: filteredIngredients
                    )
                    self.mealDetails = filteredMealDetails
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
