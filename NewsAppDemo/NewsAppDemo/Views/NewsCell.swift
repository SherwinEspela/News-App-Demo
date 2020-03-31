//
//  NewsCell.swift
//  NewsAppDemo
//
//  Created by Sherwin Espela on 2020-03-17.
//  Copyright © 2020 cybermash. All rights reserved.
//

import SwiftUI

struct NewsCell: View {
    
    let post: Post
    
    var body: some View {
        
        VStack {
            ZStack(alignment: .leading) {
                
                Image("testImage")
                    .resizable()
                    .scaledToFit()
                    
                Rectangle()
                    .fill(LinearGradient(gradient: Gradient(colors: [.white, .gray]), startPoint: .center, endPoint: .bottom))
                    .blendMode(.multiply)
                
                VStack(alignment: .leading, spacing: 7) {
                    Spacer()
                    
                    NewsTag(tagType: post.tag)
                    
                    Text(post.title)
                        .foregroundColor(.white)
                        .font(.title)

                }.padding(20)
                
                NavigationLink(destination: NewsDetailView(urlString: post.url)) {
                    EmptyView()
                }.buttonStyle(PlainButtonStyle())
            }
            
            ActionArea(dateCreatedString: post.created_at)
        }
    }
}

struct NewsCell_Previews: PreviewProvider {
    static var previews: some View {
        let post = Post(objectID: "", points: 1, title: "Test title", url: "", created_at: "date")
        return NewsCell(post: post).previewLayout(.sizeThatFits).fixedSize()
    }
}
