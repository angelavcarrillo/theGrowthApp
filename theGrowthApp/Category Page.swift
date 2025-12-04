//
//  Category Page.swift
//  theGrowthApp
//
//  Created by Timothy Soundavong on 12/4/25.
//

import SwiftUI
struct CategoryPage: View {
    
    @State private var
    selectedCategories: [String] = []
    let categories = ["Finance, Cooking, Fitness, Film, Travel, Art"]
    
    var body: some View {
        
        ZStack {
            Color.customBeige.ignoresSafeArea()
            VStack (spacing: 20) {
                Text ("Growth")
                    .font(.system(size: 40,))
                    .padding(.top, 40)
                Text ("Which of the following goals align with you?")
                    .font(.system(size :18))
                    .multilineTextAlignment(.center)
                Text ("Select up to 3 categories")
                    .font(.system(size: 16))
                    .foregroundColor(.red)
                    .padding(.bottom, 10)
            }
        }
    
        
    }
}
    #Preview {
        CategoryPage()
}
