//
//  RaindropView.swift
//  theGrowthApp
//
//  Created by Jazmine Martin on 12/4/25.
//

import SwiftUI

struct RaindropView: View {
    @State private var selectedCategory: ImageCategory = .travel
    @EnvironmentObject var treeStage: TreeStages
    @State private var selectedCategory: ImageCategory = .finance
    var body: some View {
        HStack{
            VStack{
                Menu{
                    ForEach(ImageCategory.allCases, id:\.self)
                    {category in
                        Button{selectedCategory = category} label: {if selectedCategory == category{ Label(category.title, systemImage:"checkmark")
                        } else{ Text(category.title)}
                        }
                    }
                }label : {
                    HStack{
                        Text(selectedCategory.title)
                        Image(systemName: "chevron.down")
                    }
                    .padding()
                    .background(Color.white)
                    .foregroundStyle (Color("customGreen"))
                    .cornerRadius(8)
                }
                .padding(.top, 10)
                Spacer()
                //Image("emptyRaindrop")
                VStack (spacing: 10){
                    ForEach(selectedCategory.allQuestions.indices, id:\.self)
                    {index in RainDropsViewwithOverlay(imageName: selectedCategory.imageName, questionText: selectedCategory.allQuestions[index], isReflectionTask: index == selectedCategory.allQuestions.count - 1
                    )
                    }
                    .padding()
                    Spacer()
                }
            }
        }
    }
    
}
#Preview {
    RaindropView()
}
