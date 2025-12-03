//
//  ContentView.swift
//  theGrowthApp
//
//  Created by Angela on 12/3/25.
//

import SwiftUI

struct ContentView: View {
@State private var toolbarSelection = 0
@State private var selectedScreen: Int = 0
            
            
var body: some View {
                
                
                
                
ZStack {
     Color.customBeige.ignoresSafeArea()
     Image("leaf")
     .phaseAnimator([true,false]) {content, phase in
                content
                .scaleEffect(phase ? 1.2 : 1.0)
                            
                }animation: {phase in
                .spring(duration: 0.3)
                            
            }
                            
                    
                    
                    
Spacer()
VStack {
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
                        Text("replace with view Reflection Screen")
                    default:
                        Text("replace with view No Screen Selected")
                            
                    }
                        
                }
                .padding()
                    
                    
            }
                
                
                
        }
            
                
}

#Preview {
    ContentView()
}
