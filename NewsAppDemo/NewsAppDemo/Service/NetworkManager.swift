//
//  NetworkManager.swift
//  NewsAppDemo
//
//  Created by Sherwin Espela on 2020-03-15.
//  Copyright © 2020 cybermash. All rights reserved.
//

import Foundation
import Combine

class NetworkManager: ObservableObject {
    
    @Published var posts = [Post]()
    private var cancellable: AnyCancellable?
    
    enum HTTPError: LocalizedError {
        case statusCode
    }
    
    func getPosts() -> AnyPublisher<Results, Error> {
    
        guard let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") else {
            fatalError("url provided is invalid.")
        }

        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .receive(on: RunLoop.main)
            .decode(type: Results.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
