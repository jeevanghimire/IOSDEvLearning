//
//  DetailView.swift
//  FramWork
//
//  Created by Jeevan Ghimire on 24/01/2024.
//

import SwiftUI

struct DetailView: View {
    var framework: Framework
    var body: some View {
        FrameWorkGridTitleView(frameWork: framework)
        Text(framework.description)
    }
    
}

#Preview {
    DetailView(framework:MockData.sampleFramework)
}
