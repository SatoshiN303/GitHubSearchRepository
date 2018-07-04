//
//  SearchResponse.swift
//  GitHubSearchRepository
//
//  Created by 佐藤 慎 on 2018/05/16.
//  Copyright © 2018年 佐藤 慎. All rights reserved.
//

// https://bit.ly/2IlMOoj のjsonレスポンスを内包する
public struct SearchResponse<Item: Decodable>: Decodable {
    let totalCount: Int
    let items: [Item]
    
    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case items
    }
}
