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
    
    // URLSession にわたすために URLRequestに変換
    func buildURLRequest() -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        
        switch method {
        case .get:
            // URLComponentの利用で適切なエンコードを行う
            components?.queryItems = queryItems
        default:
            fatalError("サポートされてないmethodです \(method)")
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.url = components?.url
        urlRequest.httpMethod = method.rawValue
        
        return urlRequest
    }
    
    func response(from data: Data, response: URLResponse) throws -> Response {
        let decoder = JSONDecoder()
        
        if case (200..<300)? = (response as? HTTPURLResponse)?.statusCode {
            return try decoder.decode(Response.self, from: data)
        } else {
            throw try decoder.decode(GitHubAPIError.self, from: data)
        }
        
    }
}
