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
    case finance
    case cooking
    
    var id: Self {self}

    var title: String {
        switch self{
        case.film: return "Tv/Film"
        case.travel: return "Travel"
        case.finance: return "Finance"
        case.cooking: return "cooking"
        }
    }
    var allQuestions: [String]{
        switch self{
        case.film: return["Research film production steps for an iphone"," Watch a TV show or movie", "Reflection"]
        case.travel: return ["Watch a travel vlog for a place you want to visit", "Create a Mood Board by Adding 2-3 pictures of your ideal trip", "Reflection"]
        case.finance: return ["Write 3 issues you want to correct with your business website", "Make a weekly or montlhy budget that includes costs for busines", "Reflection"]
        case.cooking: return ["Complete a recipe from youtube", "cook or bake with a lone one their favorite recipe", "Reflection"]
        }
    }
    
    var imageName: String{
        switch self {
        case.film: return "emptyRainDrop"
        case.travel: return "emptyRainDrop"
        case.finance: return "halfFullRainDrop"
        case.cooking: return "halfFullRainDrop"
        }
    }
}


