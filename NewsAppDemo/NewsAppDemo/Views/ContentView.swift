//
//  ContentView.swift
//  NewsAppDemo
//
//  Created by Sherwin Espela on 2020-03-15.
//  Copyright © 2020 cybermash. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var newsListViewModel = NewsListViewModel()
    let offsetEdgePadding: CGFloat = -20
    
    var body: some View {
        NavigationView {
            List(newsListViewModel.newsList){ post in
                NewsCell(urlString: post.url, id: post.id, title: post.title)
            }.padding(EdgeInsets(top: .zero, leading: offsetEdgePadding, bottom: .zero, trailing: offsetEdgePadding))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
