//
//  theGrowthAppApp.swift
//  theGrowthApp
//
//  Created by Angela on 12/3/25.
//

import SwiftUI

@main
struct theGrowthAppApp: App {
    @StateObject var tree = TreeStages()
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                OnboardingView()
            }
            .environmentObject(tree)
        }
    }
}
