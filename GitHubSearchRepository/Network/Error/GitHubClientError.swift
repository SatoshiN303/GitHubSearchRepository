//
//  GitHubClientError.swift
//  GitHubSearchRepository
//
//  Created by 佐藤 慎 on 2018/05/16.
//  Copyright © 2018年 佐藤 慎. All rights reserved.
//

enum GitHubClientError: Error {
    // 通信失敗
    case connectionError(Error)
    // パース失敗
    case responseParseError(Error)
    // GitHubからエラーを受け取った
    case apiError(GitHubAPIError)
}
