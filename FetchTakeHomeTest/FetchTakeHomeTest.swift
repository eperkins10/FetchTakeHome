//
//  FetchTakeHomeTest.swift
//  FetchTakeHomeTest
//
//  Created by Ethan Perkins on 8/18/24.
//

import XCTest
@testable import FetchTakeHome

final class FetchTakeHomeTest: XCTestCase {

    var sut: MealViewModel!

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    // Tests URL used to fetch meals
    func testFetchMealsURL() async throws {
        let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert")!

        let dataAndResponse: (data: Data, response: URLResponse) = try await URLSession.shared.data(from: url)

        let response = try XCTUnwrap(dataAndResponse.response as? HTTPURLResponse, "Expecting an HTTPURLResponse.")
        XCTAssertEqual(response.statusCode, 200)
    }

    // Tests URL used to fetch meal details
    func testFetchMealDetailsURL() async throws {
        let mealId = "53049"

        let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(mealId)")!

        let dataAndResponse: (data: Data, response: URLResponse) = try await URLSession.shared.data(from: url)

        let response = try XCTUnwrap(dataAndResponse.response as? HTTPURLResponse, "Expecting an HTTPURLResponse.")
        XCTAssertEqual(response.statusCode, 200)
    }

}
