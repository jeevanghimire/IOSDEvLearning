//
//  DetailView.swift
//  FramWork
//
//  Created by Jeevan Ghimire on 24/01/2024.
//

import SwiftUI

struct DetailView: View {
  
    @State private var isShowingSafariView = false
    var framework: Framework
    
    var body: some View {
       
        
        
        FrameWorkGridTitleView(frameWork: framework)
        Text(framework.description)
            .font(.body)
            .padding()
        
        Spacer()
        Button{
            isShowingSafariView = true
        } label:
        {
            Label("Learn More",systemImage: "book.fill")
        }
        .buttonStyle(.bordered)
        .controlSize(.large)
        .tint(.red)
            .sheet(isPresented: $isShowingSafariView, content:
                                {
                SafariView(url: URL(string: framework.urlString) ?? URL(string:"www.jeevangimire.me")! )
            }
            )
        
    }
}
    


#Preview {
    DetailView( framework:MockData.sampleFramework)
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)

}
