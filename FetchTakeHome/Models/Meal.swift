//
//  Meal.swift
//  FetchTakeHome
//
//  Created by Ethan Perkins on 8/15/24.
//

import Foundation

// This will be used for placing the array of meal objects into
struct Meal: Identifiable, Hashable, Codable {
    let mealName: String
    let imageURL: String
    let id: String

    enum CodingKeys: String, CodingKey {
        case mealName = "strMeal"
        case imageURL = "strMealThumb"
        case id = "idMeal"
    }
}
