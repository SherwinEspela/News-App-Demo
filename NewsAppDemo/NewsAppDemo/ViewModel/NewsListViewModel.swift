//
//  NewsListViewModel.swift
//  NewsAppDemo
//
//  Created by Sherwin Espela on 2020-03-16.
//  Copyright © 2020 cybermash. All rights reserved.
//

import Foundation
import Combine

class NewsListViewModel: ObservableObject {
    
    @Published var newsList = [Post]()
    private var cancellable: Cancellable?
    
    init() {
        getPosts()
    }
    
    func getPosts() {
        self.cancellable = NetworkManager().getPosts().map { results in
            results.hits.map { $0 }
        }.sink(receiveCompletion: { _ in }) {
            self.newsList = $0
        }
    }
}
