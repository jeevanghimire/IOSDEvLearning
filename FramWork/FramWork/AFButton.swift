//
//  AFButton.swift
//  FramWork
//
//  Created by Jeevan Ghimire on 24/01/2024.
//

import SwiftUI

struct AFButton: View {
    @State private var isSafaraiView = false
    var title:String
    var body: some View {
        Button{
            
        } label:
        {
            Text(title)
                .font(.title2)
                .fontWeight(.semibold)
                .frame(width:280,height: 60)
                .background(Color.red)
                .foregroundStyle(.white)
                .cornerRadius(10)
        }
    }
}

#Preview {
    AFButton(title: "text")
}
