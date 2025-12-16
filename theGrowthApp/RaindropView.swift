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
    //@State private var selectedScreen: Int = 0
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.customBeige
                    .ignoresSafeArea()
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
                            
                            //.frame(width: .infinity, alignment: .leading)
                            .background(Color.white)
                            .foregroundStyle (Color("customGreen"))
                            .shadow(radius: 10)
                            .cornerRadius(8)
                            Spacer()
                                .frame(width:270)
                            
                            
                        }
                        .padding(.top, 10)
                        Spacer()
                        Spacer()
                        //Image("emptyRaindrop")
                        VStack (spacing: 10){
                            ForEach(selectedCategory.allQuestions.indices, id:\.self)
                            {index in RainDropsViewwithOverlay(imageName: selectedCategory.imageName, questionText: selectedCategory.allQuestions[index], isReflectionTask: index == selectedCategory.allQuestions.count - 1
                            )
                            }
                            .padding()
                            Spacer()
//                            Picker("Screens", selection: $selectedScreen) {
//                                Image(systemName: "tree.fill").tag(0)
//                                Image(systemName: "person.crop.circle.fill").tag(1)
//                                Image(systemName: "drop.fill").tag(2)
//                            }
//                            .pickerStyle(.segmented)
//                            .tint(.customGreen)
//                            //bg didnt work for this??
//                            .padding(.horizontal, 16)
                        }
                    }
                }
            }
//            .navigationTitle("")
//            .navigationBarHidden(true)
//
//            .overlay(alignment: .top) {
//                    Group {
//                        switch selectedScreen {
//                        case 0:
//                            EmptyView()
//        case 1:
//                            NavigationLink("", destination: ReflectionView(), isActive: .constant(selectedScreen == 1))
//
//                        case 2:
//                            NavigationLink("", destination:RaindropView().environmentObject(treeStage), isActive: .constant(selectedScreen == 2))
//        
//                        default:
//                            EmptyView()
//        }
//                        }
//                }
        }
    }
    
}
#Preview {
    RaindropView()
}
