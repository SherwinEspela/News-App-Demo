//
//  NewsCell.swift
//  NewsAppDemo
//
//  Created by Sherwin Espela on 2020-03-17.
//  Copyright © 2020 cybermash. All rights reserved.
//

import SwiftUI

struct NewsCell: View {
    
    let urlString: String?
    let id: String
    let title: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            
            Image("testImage")
                .resizable()
                .scaledToFit()
            
            VStack(alignment: .leading, spacing: 7) {
                Spacer()
                
                Text("HEADLINE")
                    .padding(3)
                    .foregroundColor(.white)
                    .background(Color.red)
                    .font(.headline)
                
                Text(title)
                    .foregroundColor(.white)
                    .font(.headline)
                    .fontWeight(.bold)
            }.padding(20)
            
            NavigationLink(destination: NewsDetailView(urlString: urlString)) {
                EmptyView()
            }.buttonStyle(PlainButtonStyle())
        }
    }
}

struct NewsCell_Previews: PreviewProvider {
    static var previews: some View {
        NewsCell(urlString: "urlString", id: "id", title: "slkfjsd slkjdf slkjsdf sdlfjs fsfsjfjls")
            .previewLayout(.sizeThatFits)
    }
}
