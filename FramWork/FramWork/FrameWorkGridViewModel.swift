//
//  FrameWorkGridViewModel.swift
//  FramWork
//
//  Created by Jeevan Ghimire on 24/01/2024.
//

import SwiftUI

final class FramWorkGridViewModel: ObservableObject{
    var SelectedFrameWork: Framework?{
        didSet{
            isShowingDeafultView = true
        }
    }
    
    
   @Published var isShowingDeafultView = false
    
    
    
}
