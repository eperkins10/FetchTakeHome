//
//  MealsResponse.swift
//  FetchTakeHome
//
//  Created by Ethan Perkins on 8/17/24.
//

import Foundation

// This holds an array of meal objects
struct MealsResponse: Codable {
    let meals: [Meal]
}
