//
//  GitHubSearchRepositoryTests.swift
//  GitHubSearchRepositoryTests
//
//  Created by 佐藤 慎 on 2018/05/07.
//  Copyright © 2018年 佐藤 慎. All rights reserved.
//

import XCTest
@testable import GitHubSearchRepository

class GitHubSearchRepositoryTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testConnectonNormal() {
        let loadExpectation = expectation(description: "testConnectonNormal")
        let url = URL(string: "https://api.github.com/search/repositories?q=swift")!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        let session = URLSession.shared
        
        let task = session.dataTask(with: urlRequest) { (data, urlResponse, error) in
            guard let response = urlResponse as? HTTPURLResponse else {
                XCTFail()
                return
            }
            XCTAssertNotNil(response.statusCode)
            XCTAssertNotNil(response.allHeaderFields["Date"])
            XCTAssertNotNil(response.allHeaderFields["Content-Type"])
            loadExpectation.fulfill()
        }
        task.resume()
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testConnectionSearchRepository() {
        let loadExpectation = expectation(description: "testConnectionUseGitHubClient")
        let request = GitHubAPI.SearchRepositories(keyword: "swift")
        
        GitHubClient().send(request: request) { result in
            switch result {
            case let .success(response):
                for item in response.items {
                    print("\(item.name), \(item.owner)")
                }
                XCTAssertTrue(response.items.count > 0)
                loadExpectation.fulfill()
                return
            case let .failure(error):
                print(error)
                XCTFail()
                return
            }
        }
        
        waitForExpectations(timeout: 10, handler: nil)
    }
    
}
