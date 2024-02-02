//
//  FrameWorkGridView.swift
//  FramWork
//
//  Created by Jeevan Ghimire on 22/01/2024.
//

import SwiftUI

struct FrameWorkGridView: View {
    @StateObject var viewModel = FramWorkGridViewModel()
   
    let columns: [GridItem] = [GridItem(.flexible()),
                                GridItem(.flexible()),
                                GridItem(.flexible())]
    
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVGrid(columns:columns){
                    ForEach(MockData.frameworks, id: \.id  )
                    {
                        FrameWork in
                        
                        FrameWorkGridTitleView(frameWork: FrameWork)
                            .onTapGesture{
                                viewModel.SelectedFrameWork = FrameWork
                            }
                    }
                }
                .navigationTitle("FramWork")
                .sheet(isPresented: $viewModel.isShowingDeafultView){
                    DetailView(isShowingDetailView: $viewModel.isShowingDeafultView, framework: viewModel.SelectedFrameWork ?? MockData.sampleFramework)
                }
            }
        }
    }
}

#Preview {
    FrameWorkGridView()
        .preferredColorScheme(.dark)
}


struct FrameWorkGridTitleView: View {
    let frameWork:Framework
    var body: some View{
        VStack{
            Image(frameWork.imageName)
                .resizable()
                .frame(width: 90,height: 90)
            Text(frameWork.name)
                .font(.title2)
                .fontWeight(.semibold)
                .scaledToFit()
                .minimumScaleFactor(0.6)
        }
        .padding()
    }
}
