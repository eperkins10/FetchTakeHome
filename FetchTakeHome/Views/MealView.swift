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
                    ForEach(viewModel.meals) { meal in
                        MealCard(meal: meal)
                            .padding(.horizontal)
                            .onTapGesture {
                                selectedMeal = meal
                            }
                    }
                }
                .fullScreenCover(item: $selectedMeal) { meal in
                    MealDetailView(meal: meal)
                }
                .padding(.horizontal)
                .navigationTitle("Desserts")
                .toolbarBackground(Color(UIColor.systemBackground), for: .navigationBar)
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
