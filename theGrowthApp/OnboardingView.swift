//
//  OnboardingView.swift
//  theGrowthApp
//
//  Created by Timothy Soundavong on 12/3/25.
//

import SwiftUI

struct OnboardingView: View {
    
    var body: some View {
        
        ZStack {
            
            Color.customBeige
                .ignoresSafeArea() // fills whole screen
            
            VStack {
                Image(.leaf)
                    .resizable()
                    .frame(width:500,height:500)
                    .padding  (.top, -120)
                
                Text("Welcome to Growth!")
                    .font(.largeTitle)
                    .padding(.top, -150)
                
                Text("The app designed to grow with you and your goals.")
                    .font (.system(size: 24))
                    .multilineTextAlignment(.center)
                    .padding(.top, -90)
                    .padding(.horizontal, 60)
                
                
                Text("Select up to 3 goals, complete tasks and watch your tree grow!")
                    .font (.system(size: 24))
                    .multilineTextAlignment(.center)
                    .padding(.top, -20)
                    .padding(.horizontal, 60)
                
                
            }
            .frame(maxHeight: .infinity, alignment: .top)
        }
    }
}
    
#Preview {
    OnboardingView()
}
