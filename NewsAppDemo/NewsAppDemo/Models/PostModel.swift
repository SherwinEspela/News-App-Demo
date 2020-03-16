//
//  PostModel.swift
//  NewsAppDemo
//
//  Created by Sherwin Espela on 2020-03-15.
//  Copyright © 2020 cybermash. All rights reserved.
//

import Foundation

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
