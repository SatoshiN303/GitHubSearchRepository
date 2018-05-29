//
//  GitHubRequest.swift
//  GitHubSearchRepository
//
//  Created by 佐藤 慎 on 2018/05/29.
//  Copyright © 2018年 佐藤 慎. All rights reserved.
//

import Foundation

protocol GitHubRequest {
    associatedtype Response: Decodable
    
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var queryItems: [URLQueryItem] { get }
    var body: Encodable? { get }
}

extension GitHubRequest {
    var baseURL: URL {
        return URL(string: "https://api.github.com")!
    }
    
    var body: Encodable? {
        return nil
    }
}
