//
//  MealDetailView.swift
//  FetchTakeHome
//
//  Created by Ethan Perkins on 8/15/24.
//

import SwiftUI

struct MealDetailView: View {
    @StateObject var viewModel = MealViewModel()
    @Environment(\.dismiss) var dismiss

    let meal: Meal

    var body: some View {
        NavigationView {
            ScrollView {
                    VStack(alignment: .center) {
                        AsyncImage(url: URL(string: meal.imageURL), content: { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(maxHeight: 150)
                                .frame(width: 350)
                                .padding(10)
                        }, placeholder: {
                            Image("")
                        })
                    }
                    .frame(maxWidth: 350, maxHeight: 200)
                    .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 4)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    .padding()

                VStack(alignment: .leading) {
                    VStack(alignment: .leading) {
                        if let category = viewModel.mealDetails?.category {
                            Text(category)
                                .font(.title).bold()
                                .padding(.horizontal)
                        }
                    }

                    VStack(alignment: .leading) {
                        VStack(alignment: .leading) {
                            Text("Instructions:")
                                .font(.title3).bold()
                                .padding(.vertical, 5)

                            if let instructions = viewModel.mealDetails?.instructions {
                                Text(instructions)
                                    .multilineTextAlignment(.leading)
                                    .font(.body)
                                    .foregroundStyle(.secondary)
                            }
                        }
                        .frame(maxHeight: .infinity, alignment: .top)
                        .padding()

                        VStack(alignment: .leading) {
                            Text("Ingredients:")
                                .font(.title3).bold()
                                .padding(.horizontal)
                                .padding(.vertical, 5)

                            if let ingredients = viewModel.mealDetails?.ingredients {
                                ForEach(ingredients) { ingredient in
                                    HStack {
                                        Text("\(ingredient.name):")
                                            .foregroundStyle(.secondary)
                                        Text(ingredient.measurement)
                                            .foregroundStyle(.secondary)
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                    }
                }
            }
            .background(.ultraThinMaterial)
            .navigationTitle(meal.mealName)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Image(systemName: "xmark.circle.fill").onTapGesture {
                dismiss()
            })
        }
        .background(.ultraThinMaterial)
        .task {
            viewModel.fetchMealDetails(id: meal.id)
        }
    }
}

#Preview {
    MealDetailView(meal: Meal(
        mealName: "Apam balik",
        imageURL: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg",
        id: "53049"
    ))
    .preferredColorScheme(.dark)
}
