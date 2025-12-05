//
//  Category Page.swift
//  theGrowthApp
//
//  Created by Timothy Soundavong on 12/4/25.
//

import SwiftUI
struct CategoryPage: View {
    @State private var selectedCategories: [String] = []
    var icon: String = "leaf"

    let categories = [
        "Finance", "Cooking", "Fitness",
        "TV/Film", "Travel", "Art"
    ]

    var body: some View {
        ZStack {
            Color(.customBeige)
                .ignoresSafeArea()

            VStack(spacing: 20) {

                Text("Growth")
                    .font (.system(size: 35))
                    .padding(.top, 50)

                Text("Which of the following goals align with you?")
                    .font(.system(size: 20))
                    .multilineTextAlignment(.center)

                Text("Select up to 3 categories")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(Color.red)
                    .padding(.bottom, 10)

                // Category buttons
                ForEach(categories, id: \.self) { category in
                    let isSelected = selectedCategories.contains(category)

                    Button(action: {
                        toggle(category)
                    }) {
                        Text(category)
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.white)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(isSelected ? Color.customGreen : Color.black.opacity(1),
                                                    lineWidth: isSelected ? 10 : 3)
                                    )
                            )
                    }
                    .padding(.horizontal, 24)
                }

                Spacer()

                // Grow Button
                Button(action: {
                    print("")
                }) {
                    ZStack {
                        Text("Let’s Grow!")
                            .font(.system(size: 20, weight: .semibold))
                            
                        
                        HStack {
                            Spacer()
                            Image(.leaf)
                                .resizable()
                                .interpolation(.none)
                                .frame(width: 200, height: 200)
                                .rotationEffect(.degrees(40))
                        }
                    }
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, maxHeight: 60)
                    .background(
                        Color.white
                            .cornerRadius(30)
                            .overlay(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(Color.black.opacity(0.6), lineWidth: 2)
                            )
                            .shadow(radius: 5)
                    )
                }
            }
            .padding(.horizontal, 10)
            .padding(.bottom, 35)
        }
    }

    // Selection logic (max 3)
    private func toggle(_ category: String) {

        if selectedCategories.contains(category) {

            selectedCategories.removeAll { $0 == category }

        } else if selectedCategories.count < 3 {
            selectedCategories.append(category)
        }
    }
}

#Preview {
    CategoryPage()
}
