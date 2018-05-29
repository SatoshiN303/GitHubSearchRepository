//
//  User.swift
//  GitHubSearchRepository
//
//  Created by 佐藤 慎 on 2018/05/07.
//  Copyright © 2018年 佐藤 慎. All rights reserved.
//
//  typoしそうなのと修正で原則Swaggerで生成するべき

public struct User: Decodable {
    let id: Int
    let login: String
    let avaterURL: String
    let gravatarID: String
    let url: String
    let htmlURL: String
    let followersURL: String
    let followingURL: String
    let gistsURL: String
    let starredURL: String
    let subscriptionsURL: String
    let organizationsURL: String
    let reposURL: String
    let eventsURL: String
    let receiveEventsURL: String
    let type: String
    let sideAdmin: Bool
    
    enum CodingKeys: String, CodingKey {
        case id
        case login
        case avaterURL = "avatar_url"
        case gravatarID = "gravatar_id"
        case url
        case htmlURL = "html_url"
        case followersURL = "followers_url"
        case followingURL = "following_url"
        case gistsURL = "gists_url"
        case starredURL = "starred_url"
        case subscriptionsURL = "subscriptions_url"
        case organizationsURL = "organizations_url"
        case reposURL = "repos_url"
        case eventsURL = "events_url"
        case receiveEventsURL = "received_events_url"
        case type
        case sideAdmin = "site_admin"
    }
}
