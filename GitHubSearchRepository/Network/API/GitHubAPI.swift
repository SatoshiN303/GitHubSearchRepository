//
//  GitHubAPI.swift
//  GitHubSearchRepository
//
//  Created by 佐藤 慎 on 2018/05/29.
//  Copyright © 2018年 佐藤 慎. All rights reserved.
//
import Foundation

final class GitHubAPI {

    struct SearchRepositories: GitHubRequest {
        let keyword: String
        
        typealias Response = SearchResponse<Repository>
        
        var path: String {
            return "/search/repositories"
        }
        
        var method: HTTPMethod {
            return .get
        }
        
        var queryItems: [URLQueryItem] {
            return  [URLQueryItem(name: "q", value: keyword)]
        }
    }
    
    struct SearchUsers: GitHubRequest {
        let keyword: String
        
        typealias Response = SearchResponse<User>
        
        var path: String {
            return "/search/users"
        }
        
        var method: HTTPMethod {
            return .get
        }
        
        var queryItems: [URLQueryItem] {
            return  [URLQueryItem(name: "q", value: keyword)]
        }
    }
    
}
