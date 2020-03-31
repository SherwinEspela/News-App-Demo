//
//  PostModel.swift
//  NewsAppDemo
//
//  Created by Sherwin Espela on 2020-03-15.
//  Copyright © 2020 cybermash. All rights reserved.
//

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
    let created_at: String
    let tag: TagType = TagType.RandomTagType
}

enum TagType: String, Decodable, CaseIterable {
    case breakingNews = "Breaking News"
    case developingStory = "Developing Story"
    case opinion = "Opinion"
    case liveUpdates = "Live Updates"
    case factCheck = "Fact Check"
    case analysis = "Analysis"
    case none
    
    static var RandomTagType: TagType {
        return TagType.allCases.randomElement()!
    }
}
