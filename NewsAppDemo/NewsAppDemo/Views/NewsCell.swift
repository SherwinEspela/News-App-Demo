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
    let dateCreated: String
    
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
                    
                    Text("BREAKING NEWS")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .padding(4)
                        .foregroundColor(.white)
                        .background(Color.red)
                    
                    Text(title)
                        .foregroundColor(.white)
                        .font(.title)

                }.padding(20)
                
                NavigationLink(destination: NewsDetailView(urlString: urlString)) {
                    EmptyView()
                }.buttonStyle(PlainButtonStyle())
            }
            
            ActionArea(dateCreatedString: dateCreated)
        }
    }
}

struct NewsCell_Previews: PreviewProvider {
    static var previews: some View {
        NewsCell(urlString: "urlString", id: "id", title: "test title", dateCreated: "date" )
            .previewLayout(.sizeThatFits).fixedSize()
    }
}
