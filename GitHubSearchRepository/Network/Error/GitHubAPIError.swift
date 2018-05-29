//
//  GitHubAPIError.swift
//  GitHubSearchRepository
//
//  Created by 佐藤 慎 on 2018/05/16.
//  Copyright © 2018年 佐藤 慎. All rights reserved.
//

public struct GitHubAPIError: Error, Decodable {
    let message: String
    let fieldErrors: [FiledError]
    
    struct FiledError: Decodable {
        let resource: String
        let field: String
        let code: String
    }
}
