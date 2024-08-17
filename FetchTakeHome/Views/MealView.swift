//
//  ContentView.swift
//  FetchTakeHome
//
//  Created by Ethan Perkins on 8/15/24.
//

import SwiftUI

struct MealView: View {
    @StateObject var viewModel = MealViewModel()
    @State var selectedMeal: Meal?

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    ForEach(viewModel.meals, id: \.self) { meal in
                            MealCard(meal: meal)
                                .onTapGesture {
                                    Task {
                                        viewModel.fetchMealsById(id: meal.id)
                                        viewModel.selectedMeal = meal
                                    }
                                }
                        }
                    .fullScreenCover(item: $selectedMeal) { meal in
                            MealDetailView()
                        }
                }
                .padding(.horizontal)
                .navigationTitle("Desserts")
            }
        }
        .padding()
        .task {
            viewModel.fetchMeals()
        }
    }
}

#Preview {
    MealView()
        .preferredColorScheme(.dark)
}
