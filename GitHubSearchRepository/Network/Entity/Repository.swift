//
//  Repository.swift
//  GitHubSearchRepository
//
//  Created by 佐藤 慎 on 2018/05/16.
//  Copyright © 2018年 佐藤 慎. All rights reserved.
//

public struct Repository: Decodable {
    let id: Int
    let name: String
    let fullName: String
    let owner: User
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case fullName = "full_name"
        case owner 
    }
}
