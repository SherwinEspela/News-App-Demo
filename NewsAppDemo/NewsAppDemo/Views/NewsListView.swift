//
//  NewsListView.swift
//  NewsAppDemo
//
//  Created by Sherwin Espela on 2020-03-18.
//  Copyright © 2020 cybermash. All rights reserved.
//

import SwiftUI

struct NewsListView: View {
    
    @ObservedObject private var newsListViewModel = NewsListViewModel()
    let offsetEdgePadding: CGFloat = -20
    
    init() {
        // To remove only extra separators below the list:
        UITableView.appearance().tableFooterView = UIView()

        // To remove all separators including the actual ones:
        UITableView.appearance().separatorStyle = .none
    }
    
    var body: some View {
        List(newsListViewModel.newsList){ post in
            NewsCell(urlString: post.url, id: post.id, title: post.title)
        }.padding(EdgeInsets(top: .zero, leading: offsetEdgePadding, bottom: .zero, trailing: offsetEdgePadding))
    }
}

struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListView()
    }
}
