//
//  ReflectionDetailView.swift
//  theGrowthApp
//
//  Created by Ali Qasem on 12/4/25.
//

import SwiftUI

struct ReflectionDetailView: View {
    let category: String
    @State private var answer = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16){
            Text(category)
                .font(.title2)
                .bold()
            
            // hard coded questions here
            Text("What helped you stay calm or focused?")
                .font(.headline)
            
            Text("Type your reflection below: ")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            TextEditor(text:$answer)
                .frame(height: 180)
                .overlay(
                    RoundedRectangle(cornerRadius: 12) .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                    )
            Button("Save"){
                print("Saved answer for \(category): \(answer) =")
                    
            }
            .frame(maxWidth: .infinity)
            .padding().background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(16)
            
            Spacer()
        }
        .padding()
        .navigationTitle("Reflection")
        .navigationBarTitleDisplayMode( .inline)
    }
}

#Preview {
    NavigationStack{
        ReflectionDetailView(category: "Cooking")
    }
}
