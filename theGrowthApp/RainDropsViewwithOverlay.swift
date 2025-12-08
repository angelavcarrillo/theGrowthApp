//
//  RainDropsViewwithOverlay.swift
//  theGrowthApp
//
//  Created by Jazmine Martin on 12/4/25.
//

import SwiftUI

enum RainDropFillState {
    case empty
    case half
    case full
}

struct RainDropsViewwithOverlay: View {
    let imageName: String
    let questionText: String
    let isReflectionTask: Bool
    
    @State private var fillState: RainDropFillState = .empty
    @State private var navigateToReflection = false
    @State private var animate = false
    
    var body: some View {
        ZStack{
            //NavigationLink(
                //destination: Text ("this line of code is a placeholder") //ReflectionView (onComplete: {fillState = .full
        }
          // )   //  isActive: $navigateToReflection
           // ) {
               // EmptyView()
           // }
            //.hidden()
            NavigationLink(
                destination: ReflectionView(),
                isActive: $navigateToReflection
            ) {
                EmptyView()
            }
            .hidden()
            
            
            HStack(alignment: .center){
                Image(imageForState())
                //disregard this line of code for now if it the links don't work I will be redoing them (isTaskComplete ? "emptyRaindrop" : "fullRaindrop")
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(animate ? 1.05 : 1.0)
                    .animation (.easeInOut(duration:1.2).repeatForever(autoreverses: true),value: animate)
                    .onAppear{ animate = true}
                //same here disregard.frame(width:300, height:300)
                    .overlay(alignment:.bottom)
                {
                    Text(questionText)
                        .font(.caption)
                        .padding(5)
                        .multilineTextAlignment(.center)
                        .frame(width:200, height:50)
                        .background(Color("customBlue").opacity(0.7))
                        .foregroundColor(.white)
                    
                    //disregard unless new code does not work(isTaskComplete ? Color("customBlue").opacity(0.8) : Color("customlightBlue").opacity(0.8))
                        //disregard unless new code does not work.foregroundStyle(isTaskComplete ? Color.white: Color("customBeige"))
                        .cornerRadius(10)
                    //.offset(x:-15, y:35)
                        .padding(.bottom,12)
                    
                }
                //.frame(maxHeight:500)
                .onTapGesture{
                    if isReflectionTask{ fillState = .half
                        navigateToReflection = true
                    } else{
                        fillState = (fillState == .full) ? .empty : .full
                        //isTaskComplete.toggle()
                    }
                }
            }
        }
    private func imageForState () -> String {
        switch fillState {
        case .empty : return "emptyRaindrop"
        case .half : return "halffullRaindrop"
        case .full : return "fullRaindrop"
        }
    }
    
    
    
    }
//    //private func imageForState () -> String {
//        //switch fillState {
//        //case .empty : return "emptyRaindrop"
//        case .half : return "halffullRaindrop"
//        case .full : return "fullRaindrop"
//        }
//    }
        struct ImageView: View{
            let selectedCategory: ImageCategory
            
            var body: some View{
                ScrollView{
                    VStack{
                        HStack(spacing:10){
                            ForEach(0..<3, id:\.self){
                                index in RainDropsViewwithOverlay(imageName:selectedCategory.imageName,
                                                                  questionText:selectedCategory.allQuestions[index],
                                                                  isReflectionTask: index == 2)
                            }
                        }
                    }
                    .padding()
                }
                
                .navigationTitle(selectedCategory.title)
            }
        }

