//
//  MealCard.swift
//  FetchTakeHome
//
//  Created by Ethan Perkins on 8/16/24.
//

import SwiftUI

struct MealCard: View {
    @StateObject var viewModel = MealViewModel()

    let meal: Meal

    var body: some View {
        VStack(alignment: .leading) {
            VStack {
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
            .cornerRadius(15)
            .contentShape(Rectangle())

            VStack(alignment: .leading, spacing: 8) {
                Text(meal.mealName)
                    .font(.headline)
                    .foregroundStyle(.gray)
            }
            .padding(.horizontal)
        }
        .padding()
    }
}

#Preview {
    MealCard(meal: Meal(
        mealName: "Apam balik",
        imageURL: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg",
        id: "53049"
        ))
        .preferredColorScheme(.dark)
}
