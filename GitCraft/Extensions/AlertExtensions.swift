//
//  AlertExtension.swift
//  GitCraft
//
//  Created by Jacob Holland on 3/20/20.
//  Copyright © 2020 Jacob Holland. All rights reserved.
//

import UIKit

extension UIAlertController {
    convenience init(from error: Error) {
        self.init(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        addAction(UIAlertAction(title: "OK", style: .default))
    }
}

