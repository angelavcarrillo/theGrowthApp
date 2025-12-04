//
//  RainDropsViewwithOverlay.swift
//  theGrowthApp
//
//  Created by Jazmine Martin on 12/4/25.
//

import SwiftUI

struct RainDropsViewwithOverlay: View {
    let imageName: String
    let questionText: String

    var body: some View {
        ZStack(alignment: .center){
            Image("emptyRaindrop")
                .resizable()
                .frame(width: 400, height: 400)
                .overlay(alignment:.center){
                    Text(questionText)
                        .font(.caption)
                        .padding(5)
                        .background(Color.white.opacity(0.8))
                        .foregroundStyle(.black)
                        .cornerRadius(5)
                        .padding(2)
                }
                .frame(maxHeight:200)
        }
    }
}

struct ImageView: View{
    let selectedCategory: ImageCategory
    
    var body: some View{
        ScrollView{
            VStack{
                HStack(spacing:10){
                    ForEach(0..<3, id:\.self){
                        index in RainDropsViewwithOverlay(imageName:selectedCategory.imageName,
                                                          questionText:selectedCategory.allQuestions[index])
                    }
                }
            }
            .padding()
        }

.navigationTitle(selectedCategory.title)
}
}
