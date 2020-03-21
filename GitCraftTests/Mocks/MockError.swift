//
//  MockError.swift
//  GitCraftTests
//
//  Created by Jacob Holland on 3/21/20.
//  Copyright © 2020 Jacob Holland. All rights reserved.
//

import Foundation

struct MockError: Error {
    private let text: String
    
    init(text: String = "An error has occured!") {
        self.text = text
    }
}

extension MockError: Equatable { }

extension MockError: LocalizedError {
    var errorDescription: String? { text }
}

