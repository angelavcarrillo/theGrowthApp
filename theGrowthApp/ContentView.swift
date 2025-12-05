//created by angela carrillo

import SwiftUI

struct ContentView: View {
@State private var toolbarSelection = 0
@State private var selectedScreen: Int = 0
@State private var floating = false
let leafCount = 20
    
    
    var leaves: [FloatingLeaves]{
        (0..<leafCount).map{
            _ in FloatingLeaves(
                xOffset: CGFloat.random(in: -250...500),
                yoffset: CGFloat.random(in: -500...500),
                
            )
        }
    }
var body: some View {
                
            
        ZStack {
            Color.customBeige.ignoresSafeArea()
            ForEach(0..<leafCount,id: \.self){oneLeaf in leaves[oneLeaf]}
            
            //.allowsTap
            
            
            
            
            Spacer()
            VStack {
                
                Image("sapling")
                    .resizable()
                    .scaledToFit()
                    .frame(width:300,height:500)
                    //.safeAreaInset(edge: .bottom)
                    
                Picker("Home screen or reflection screen?",selection: $toolbarSelection){
                    Image(systemName: "tree.fill").tag(0)
                        .foregroundStyle(Color(.customGreen))
                    Image(systemName:"person.crop.circle.fill").tag(1)
                        .foregroundColor(Color(.customGreen))
                }.pickerStyle(SegmentedPickerStyle())
                
                switch selectedScreen{
                case 0:
                    Text("replace with view Home Screen()")
                case 1:
                    Text("Reflection Page")
                default:
                    Text("replace with view No Screen Selected")
                    
                }
                
            }
            .padding()
            
            
        }
    
                
                
                
        }
            
                
}
struct FloatingLeaves: View{
    @State private var floating = false
    let xOffset: CGFloat
    let yoffset: CGFloat
    
    var body: some View{
        Image("leaf")
            .resizable()
            .scaledToFit()
            //.opacity(0.50)
            .frame(width: 130, height: 130)
            .offset(x: xOffset, y: yoffset)
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
