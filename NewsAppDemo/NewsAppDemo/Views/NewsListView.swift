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
        
        // FIXME: try solution mention on this link
        // https://stackoverflow.com/questions/56505528/swiftui-update-navigation-bar-title-color
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    var body: some View {
        NavigationView {
            List(newsListViewModel.newsList){ post in
                NewsCell(urlString: post.url, id: post.id, title: post.title, dateCreated: post.created_at ).buttonStyle(PlainButtonStyle())
            }.padding(EdgeInsets(top: .zero, leading: offsetEdgePadding, bottom: .zero, trailing: offsetEdgePadding))
            
            .navigationBarTitle(
                Text("MAIN")
                    .foregroundColor(.white),
                displayMode: .inline
            )
        
            .background(Color.white)
        }
    }
}

struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListView()
    }
}
