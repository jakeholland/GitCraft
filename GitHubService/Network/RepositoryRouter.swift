//
//  RepositoryRouter.swift
//  GitHubService
//
//  Created by Jacob Holland on 3/20/20.
//  Copyright © 2020 Jacob Holland. All rights reserved.
//

enum RepositoryRouter: GitHubEndpointRouter {

    //https://developer.github.com/v3/repos/#list-repositories-for-a-user
    case getRepository(username: String, type: RespositoryType, sort: SortType, sortDirection: SortDirection)

    var components: RequestComponents {
        switch self {
        case .getRepository(let username, let type, let sort, let direction):
            let queries: Parameters = [
                "type": type.rawValue,
                "sort": sort.rawValue,
                "direction": direction.rawValue
            ]

            return RequestComponents(method: .get, path: "users/\(username)/repos", queries: queries)
        }
    }
}
