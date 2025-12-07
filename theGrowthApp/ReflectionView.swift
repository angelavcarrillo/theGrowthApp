//
//  ReflectionListView.swift
//  Patience
//
//  Created by Ali Qasem on 12/2/25.
//

import SwiftUI

struct ReflectionView: View {
    var body: some View {
        NavigationStack{
            VStack(spacing: 20){
                Text("Reflection")
                    .font(.largeTitle)
                    .padding(.top)
                
                Text("Choose a topic to answer the question.")
                    .font(.subheadline)
                
                Button {
                    print("Tapped Cooking")
                }label: {
                    Text("Cooking")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                        )
                        .shadow(radius: 2)
                
                }
                
        
                
                Button {
                    print("Tapped Travel")
                }label: {
                    Text("Travel")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                        )
                        .shadow(radius: 2)
                
                }
                
            
                
                Button {
                    print("Tapped TV / Film")
                }label: {
                    Text("TV / Film")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                        )
                        .shadow(radius: 2)
                
                }
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    ReflectionView()
}
