//
//  Category Page.swift
//  theGrowthApp
//
//  Created by angela carrillo
import SwiftUI

struct ContentView: View {
@State private var selectedScreen: Int = 0
@State private var floating = false
@StateObject var treeStage = TreeStages()
@State private var selectedCategory: ImageCategory = .travel
let leafCount = 20
    
var leaves: [FloatingLeaves] {
    (0..<leafCount).map { _ in
            FloatingLeaves(
                xAxis: CGFloat.random(in: -250...500),
                yAxis: CGFloat.random(in: -500...500)
            )
        }
}
    
var body: some View {
        
        NavigationStack {
            ZStack {
                Color.customBeige.ignoresSafeArea()
                
                ForEach(0..<leafCount, id: \.self) { i in
                    leaves[i]
                }
                //allowstap?
                VStack {
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
                        .shadow(radius: 10)
                        .cornerRadius(8)
                        Spacer()
                    }
                    .padding(.top, 10)
                    Spacer()
                    Image(treeStage.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                    
                    Spacer()
                    Picker("Screens", selection: $selectedScreen) {
                        Image(systemName: "tree.fill").tag(0)
                        Image(systemName: "person.crop.circle.fill").tag(1)
                        Image(systemName: "drop.fill").tag(2)
                    }
                    .pickerStyle(.segmented)
                    .tint(.customGreen)
                    .shadow(radius: 10)
                    //bg didnt work for this??
                    .padding(.horizontal, 16)
                }
                .padding()
                
                
        }
        .navigationTitle("")
        .navigationBarHidden(true)

        .overlay(alignment: .top) {
                Group {
                    switch selectedScreen {
                    case 0:
                        EmptyView()
    case 1:
                        NavigationLink("", destination: ReflectionView(), isActive: .constant(selectedScreen == 1))

                    case 2:
                        NavigationLink("", destination:RaindropView().environmentObject(treeStage), isActive: .constant(selectedScreen == 2))
    
                    default:
                        EmptyView()
    }
                    }
            }
}
}
}

struct FloatingLeaves: View{
    @State private var floating = false
    let xAxis: CGFloat
    let yAxis: CGFloat
    
    var body: some View{
        Image("leaf")
            .resizable()
            .scaledToFit()
        //.opacity(0.50)
            .frame(width: 100, height: 100)
            .offset(x: xAxis, y: yAxis)
            .rotationEffect(.degrees(floating ? -1 : 9))
            .animation(.easeInOut(duration: 4.0).repeatForever(autoreverses: true),value: floating)
            .onAppear {
                floating.toggle()
            }
        
        
    }
}

#Preview {
    ContentView()
}
