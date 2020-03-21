//
//  IssueExtension.swift
//  GitCraft
//
//  Created by Jacob Holland on 3/21/20.
//  Copyright © 2020 Jacob Holland. All rights reserved.
//

import GitHubService
import UIKit

extension Issue {
    private var closedImage: UIImage { UIImage(systemName: "checkmark.circle")!.withTintColor(.systemGreen) }
    private var openImage: UIImage { UIImage(systemName: "exclamationmark.circle")!.withTintColor(.systemRed) }
    var badgeImage: UIImage { isClosed ? closedImage : openImage }
}
