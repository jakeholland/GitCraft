//
//  UIViewControllerExtension.swift
//  GitCraft
//
//  Created by Jacob Holland on 3/20/20.
//  Copyright © 2020 Jacob Holland. All rights reserved.
//

import UIKit

extension UIViewController {
    func presentError(_ error: Error) {
        let errorAlertController: UIAlertController = .init(from: error)
        present(errorAlertController, animated: true)
    }
}
