//
//  DetailView.swift
//  FramWork
//
//  Created by Jeevan Ghimire on 24/01/2024.
//

import SwiftUI

struct DetailView: View {
    @Binding var isShowingDetailView :Bool
    @State private var isShowingSafariView = false
    var framework: Framework
    
    var body: some View {
        HStack{
            Spacer()
            Button{
                isShowingDetailView = false
            } label: {
                Image(systemName:"xmark")
                    .foregroundColor(Color(.label))
                    .imageScale(.large)
                    .frame(width: 44,height: 44)
            }
            .padding()
        }
        
        Spacer()
        FrameWorkGridTitleView(frameWork: framework)
        Text(framework.description)
            .font(.body)
            .padding()
        
        Spacer()
        Button{
            isShowingSafariView = false
        } label:
        {
            Text("Learn More")
                .font(.title2)
                .fontWeight(.semibold)
                .frame(width:280,height: 60)
                .background(Color.red)
                .foregroundStyle(.white)
                .cornerRadius(10)
        }
            .sheet(isPresented: $isShowingDetailView, content:
                                {
                SafariView(url: URL(string: framework.urlString) ?? URL(string:"www.jeevangimire.me")! )
            }
            )
        
    }
}
    


#Preview {
    DetailView(isShowingDetailView: .constant(false), framework:MockData.sampleFramework)
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)

}
