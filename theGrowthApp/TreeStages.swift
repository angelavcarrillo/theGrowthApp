
import SwiftUI
import Foundation
internal import Combine

class TreeStages: ObservableObject {
    @Published var stages: Int = 0
    var imageName:String{
        switch stages{
        case 1:
            return "treeStage3"
        case 2:
            return "treeStage3"
        case 3:
            return "treeStage3"
        default:
            return "sapling"
        }
    }
    
func growTree(forRaindrop index: Int){
        stages = max(stages, index + 1)
    }
    
}
