//
//  MealCard.swift
//  FetchTakeHome
//
//  Created by Ethan Perkins on 8/16/24.
//

import SwiftUI

struct MealCard: View {
    @State var meal: Meal?

    var body: some View {
        VStack(alignment: .leading) {
            VStack {
                AsyncImage(url: meal?.strMealThumb)
                    .scaledToFill()
                    .frame(maxHeight: 130)
                    .padding(10)
                .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 4)
            }
            .frame(maxWidth: .infinity, maxHeight: 200)
            .cornerRadius(15)

            VStack(alignment: .leading, spacing: 8) {
                Text(meal?.strCategory ?? "dessert")
                    .font(.headline)
                    .foregroundStyle(.gray)

                Text(meal?.strMeal ?? "pie")
                    .font(.title3).bold()

            }
        }
    }
}

#Preview {
    MealCard()
        .preferredColorScheme(.dark)
}
