//
//  MealDetailView.swift
//  FetchTakeHome
//
//  Created by Ethan Perkins on 8/15/24.
//

import SwiftUI

struct MealDetailView: View {
    @State var meal: Meal?

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    VStack {
                        AsyncImage(url: meal?.strMealThumb)
                            .scaledToFill()
                            .frame(maxHeight: 150)
                            .padding(10)
                            .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 4)
                    }
                    .cornerRadius(15)
                    .padding()

                    Text(meal?.strCategory ?? "Dessert")
                        .font(.title).bold()
                        .padding(.horizontal)

                    VStack(alignment: .leading) {
                        VStack(alignment: .leading) {
                            Text("Instructions:")
                                .font(.title3).bold()
                                .padding(.vertical, 5)
                            Text(meal?.strInstructions ?? "instructions")
                                .font(.body)
                                .foregroundStyle(.white.opacity(0.7))
                        }
                        .frame(maxHeight: .infinity, alignment: .top)
                        .padding()

                        VStack(alignment: .leading) {
                            Text("Ingredients:")
                                .font(.title3).bold()
                                .padding(.horizontal)

                            
                        }
                    }
                }
            }
            .background(.ultraThinMaterial)
            .navigationTitle(meal?.strMeal ?? "Dessert")
            .navigationBarItems(trailing: Image(systemName: "xmark.circle.fill"))
        }
    }
}

#Preview {
    MealDetailView()
        .preferredColorScheme(.dark)
}
