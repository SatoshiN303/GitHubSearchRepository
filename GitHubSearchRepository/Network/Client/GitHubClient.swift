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
        completion: (Result<Request.Response, GitHubClientError>) -> Void) {
        
    }
}

