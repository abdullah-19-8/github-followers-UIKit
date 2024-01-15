//
//  User.swift
//  GHFollowers
//
//  Created by Abdulla Ahmad on 1/15/24.
//

import Foundation

struct User: Codable {
    var login: String
    var avatarUrl: String
    var name: String?
    var location: String?
    var bio: String?
    var publicRepos: Int
    var publicGists: Int
    var htmlUrl: String
    var following: Int
    var follower: Int
    var createdAt: String
}
