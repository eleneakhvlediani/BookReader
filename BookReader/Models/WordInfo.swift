//
//  WordInfo.swift
//  BookReader
//
//  Created by Elene Akhvlediani on 21/02/2019.
//  Copyright © 2019 Elene Akhvlediani. All rights reserved.
//

import Foundation

protocol ToStringConvertable {
    var description: String { get }
}

struct WordInfo: ToStringConvertable {
    let name: String
    let count: Int
    let isPrime: Bool
    var description: String {
        let primeTitle = isPrime ? "Prime" : "Not Prime"
        return "\(name): \(count)    \(primeTitle)"
    }
}

extension Array where Element: ToStringConvertable {
    var description: String {
        var fullString: String = ""
        self.forEach { text in
            fullString.append(text.description)
            fullString.append("\n")
            fullString.append("\n")
        }
        return fullString
    }
}
