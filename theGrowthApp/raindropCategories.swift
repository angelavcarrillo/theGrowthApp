//
//  raindropCategories.swift
//  theGrowthApp
//
//  Created by Jazmine Martin on 12/4/25.
//

import SwiftUI

enum ImageCategory: CaseIterable, Hashable{
    case film
    case travel
    //case finance
    case cooking
    
    var id: Self {self}

    var title: String {
        switch self{
        case.film: return "Tv/Film"
        case.travel: return "Travel"
        //case.finance: return "Finance"
        case.cooking: return "Cooking"
        }
    }
    var allQuestions: [String]{
        switch self{
        case.film: return["Research film production steps for an iPhone"," Watch a TV show or movie you have been putting off", "Reflection"]
        case.travel: return ["Watch a travel vlog about a place you want to visit", "Create a mood board for your ideal trip", "Reflection"]
        //case.finance: return ["Write 3 issues you want to correct on business website", "Make a weekly/montlhy budget that includes business costs ", "Create a marketing plan: Reflection"]
        case.cooking: return ["Complete a recipe from Youtube", "Cook or bake a favorite recipe with a friend", "Reflection"]
        }
    }
    
    var imageName: String{
        switch self {
        case.film: return "emptyRainDrop"
        case.travel: return "emptyRainDrop"
        //case.finance: return "halfFullRainDrop"
        case.cooking: return "halfFullRainDrop"
        }
    }
}


