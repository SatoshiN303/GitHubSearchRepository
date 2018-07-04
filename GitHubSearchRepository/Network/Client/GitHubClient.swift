//
//  GitHubClient.swift
//  GitHubSearchRepository
//
//  Created by 佐藤 慎 on 2018/06/01.
//  Copyright © 2018年 佐藤 慎. All rights reserved.
//
import Foundation

public class GitHubClient {
    // ストアドプロパティで使い回す
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        return session
    }()
    
    // completionを型引数の連想型で表すことでリクエストを渡してからモデルのインスタンスを受け取るまで型情報を保ったままでいられる。
    func send<Request: GitHubRequest>(
        request: Request,
        completion: @escaping (Result<Request.Response, GitHubClientError>) -> Void) {
        let urlRequest = request.buildURLRequest()
        
        let task = session.dataTask(with: urlRequest) { (data, urlResponse, error) in
            switch (data, urlResponse, error) {
            case (_, _, let error?):
                completion(Result(error: .connectionError(error)))
            
            case (let data?, let urlResponse?, _):
                do {
                    let response = try request.response(from: data, response: urlResponse)
                    completion(Result(value: response))
                } catch let error as GitHubAPIError {
                    completion(Result(error: .apiError(error)))
                } catch {
                    completion(Result(error: .responseParseError(error)))
                }
            
            default:
                print("invalid response \(data), \(urlResponse), \(String(describing: error))")
                return
            }
        }
        
        task.resume()
    }
}

