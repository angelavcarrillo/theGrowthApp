//
//  OnboardingView.swift
//  theGrowthApp
//
//  Created by Timothy Soundavong on 12/3/25.
//

import SwiftUI

struct OnboardingView: View {
    
    var body: some View {
        
        NavigationStack {
        
        ZStack {
            
            Color.customBeige
                .ignoresSafeArea() // fills whole screen
            
                VStack {
                    //Spacer()
                    Image(.leaf)
                        .resizable()
                        .interpolation(.none)
                        .frame(width:100,height:100)
                        .padding  (.top, -200)
                    
                    Text("Welcome to Growth!")
                        .font(.largeTitle)
                        .padding(.top, -100)
                    
                    Text("The app designed to grow with you and your goals.")
                        .font (.system(size: 24))
                        .multilineTextAlignment(.center)
                        .padding(.top ,-65)
                        .padding(.horizontal, 60)
                    
                    
                    Text("Select up to 3 goals, complete tasks and watch your tree grow!")
                        .font (.system(size: 24))
                        .multilineTextAlignment(.center)
                        .padding()
                        .padding(.horizontal, 60)
                    

                    NavigationLink(destination: CategoryPage()) {
                        Text("Next")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: 100)
                            .background(Color.customGreen)
                            .cornerRadius(12)
                    }
                    
                    }
            
                    }
                
            }
        
        }
    
    }




#Preview {
    OnboardingView()
}
