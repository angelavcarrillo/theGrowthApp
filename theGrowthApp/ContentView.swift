//created by angela carrillo

import SwiftUI

struct ContentView: View {
@State private var selectedScreen: Int = 0
@State private var floating = false
@State private var move = NavigationPath()
@StateObject var treeStage = TreeStages()
let leafCount = 20
    
    
    var leaves: [FloatingLeaves]{
        (0..<leafCount).map{
            _ in FloatingLeaves(
                xAxis: CGFloat.random(in: -250...500),
                yAxis: CGFloat.random(in: -500...500),
                
            )
        }
    }
var body: some View {
                
            
    NavigationStack(path: $move) {
        ZStack {
            Color.customBeige.ignoresSafeArea()
            ForEach(0..<leafCount,id: \.self){oneLeaf in leaves[oneLeaf]}
            
            //.allowsTap
            
            
            
            
            //Spacer()
            VStack {
                Spacer()
                Image(treeStage.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width:300,height:300)
                //.safeAreaInset(edge: .bottom)
                Spacer()
                Picker("Home screen or reflection screen?",selection: $selectedScreen){
                    Image(systemName: "tree.fill").tag(0)
                    Image(systemName:"person.crop.circle.fill").tag(1)
                    Image(systemName: "drop.fill").tag(2)
                        
                }.pickerStyle(.segmented)
                .tint(Color(.red))
                .onChange(of: selectedScreen) {navigate(to: selectedScreen)
                    }

                
            }
            .padding()
            
            
        }
        .navigationDestination(for: Int.self){
            value in switch value{
            case 0:
                ContentView()
            case 1:
                ReflectionView()
            case 2:
                RaindropView()
            default:
                ContentView()
            }
        }
    }
    
                

    }
    func navigate(to screen: Int){
        move.removeLast(move.count)
        move.append(screen)
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
            .rotationEffect(.degrees(floating ? -10 : 5))
            .animation(.easeInOut(duration: 4.0).repeatForever(autoreverses: true),value: floating)
            .onAppear {
                floating.toggle()
            }
        
        
                }
    
}


#Preview {
    ContentView()
}
