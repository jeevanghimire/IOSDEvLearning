//
//  FrameWorkGridView.swift
//  FramWork
//
//  Created by Jeevan Ghimire on 22/01/2024.
//

import SwiftUI

struct FrameWorkGridView: View {
    @StateObject var viewModel = FramWorkGridViewModel()
   
  
    var body: some View {
        NavigationStack{
            ScrollView{
                LazyVGrid(columns:viewModel.columns){
                    ForEach(MockData.frameworks  )
                    {
                        FrameWork in
                        NavigationLink(value: FrameWork){
                            
                            FrameWorkGridTitleView(frameWork: FrameWork)
                        }
                        
                           
                    }
                }
                .navigationTitle("FramWork")
                .navigationDestination(for:Framework.self){
                    Framework in
                   DetailView( framework: Framework)
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
