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
    
    var body: some View {
        NavigationView {
            List(newsListViewModel.newsList){ post in
                NavigationLink(destination: NewsDetailView(urlString: post.url)) {
                    HStack {
                        Text(post.id)
                        Text(post.title)
                    }
                }
            }
        .navigationBarTitle("MAIN PAGE")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
