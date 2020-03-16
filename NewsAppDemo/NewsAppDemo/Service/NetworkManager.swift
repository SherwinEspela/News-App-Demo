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
    
    private var cancellable: AnyCancellable?
    
    enum HTTPError: LocalizedError {
        case statusCode
    }
    
    @Published var posts = [Post]()

    func fetchPostsData() {
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in

                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.hits
                                print(self.posts)
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }

            task.resume()
        }
    }
    
    func getPosts() {
    
        guard let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page") else {
            fatalError("url provided is invalid.")
        }

        self.cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .receive(on: RunLoop.main)
            .decode(type: Results.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):

                    print(error.localizedDescription)
                }
            }, receiveValue: { print($0) })
    }
}
