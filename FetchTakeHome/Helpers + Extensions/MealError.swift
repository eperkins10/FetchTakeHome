//
//  MealError.swift
//  FetchTakeHome
//
//  Created by Ethan Perkins on 8/16/24.
//

import Foundation

// This is used to clean up error handling statements
enum MealError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}
