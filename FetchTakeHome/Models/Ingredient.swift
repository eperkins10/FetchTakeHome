//
//  Ingredient.swift
//  FetchTakeHome
//
//  Created by Ethan Perkins on 8/17/24.
//

import Foundation

// This will be used for placing ingredients/measurements into, so they're easily accessible
struct Ingredient: Identifiable {
    let id = UUID().uuidString
    let name: String
    let measurement: String
}
