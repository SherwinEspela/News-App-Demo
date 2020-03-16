//
//  NewsAppDemoTests.swift
//  NewsAppDemoTests
//
//  Created by Sherwin Espela on 2020-03-15.
//  Copyright © 2020 cybermash. All rights reserved.
//

import XCTest
@testable import NewsAppDemo

class NewsAppDemoTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testFetchPostData() {
        // test if FetchPostData function works properly
        // fetch response is expected to return 20 posts
        let networkManager = NetworkManager()
        networkManager.fetchPostsData()
        let results = networkManager.posts
        XCTAssertTrue(results.count == 20)
    }
}
