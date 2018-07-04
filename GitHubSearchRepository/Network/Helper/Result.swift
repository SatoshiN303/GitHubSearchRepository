//
//  Result.swift
//  GitHubSearchRepository
//
//  Created by 佐藤 慎 on 2018/06/08.
//  Copyright © 2018年 佐藤 慎. All rights reserved.
//

enum Result<T, Error: Swift.Error> {
    case success(T)
    case failure(Error)
    
    init(value: T) {
        self = .success(value)
    }
    
    init(error: Error) {
        self = .failure(error)
    }
}
