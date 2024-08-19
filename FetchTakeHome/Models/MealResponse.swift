//
//  MealResponse.swift
//  FetchTakeHome
//
//  Created by Ethan Perkins on 8/17/24.
//

import Foundation

// This holds an array of a meal detail response
struct MealResponse: Codable {
    let meals: [MealDetailResponse]
}
