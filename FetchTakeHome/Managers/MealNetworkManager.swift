//
//  MealNetworkManager.swift
//  FetchTakeHome
//
//  Created by Ethan Perkins on 8/16/24.
//

import Foundation

class MealNetworkManager {

    // Fetches meals upon opening app
    func fetchMeals() async throws -> [Meal] {
        let endpoint = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"

        guard let url = URL(string: endpoint) else {
            throw MealError.invalidURL
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw MealError.invalidResponse
        }

        do {
            let decoder = JSONDecoder()
            return try decoder.decode(MealResponse.self, from: data).meals
        } catch {
            throw MealError.invalidData
        }
    }

    // Fetches meal that is tapped on by the user
    func fetchMealById(_ mealId: String) async throws -> Meal {
        let endpoint = "https://themealdb.com/api/json/v1/1/lookup.php?i=\(mealId)"

        guard let url = URL(string: endpoint) else {
            throw MealError.invalidURL
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw MealError.invalidResponse
        }

        do {
            let decoder = JSONDecoder()
            return try decoder.decode(Meal.self, from: data)
        } catch {
            throw MealError.invalidData
        }
    }
}
