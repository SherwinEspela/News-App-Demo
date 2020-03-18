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
        ZStack {
            
            Image("testImage")
                .resizable()
                .scaledToFit()
            
            VStack {
                Text(id)
                Text(title)
            }
            
            NavigationLink(destination: NewsDetailView(urlString: urlString)) {
                EmptyView()
            }.buttonStyle(PlainButtonStyle())
        }
        
    }
}

struct NewsCell_Previews: PreviewProvider {
    static var previews: some View {
        NewsCell(urlString: "urlString", id: "id", title: "title")
    }
}
