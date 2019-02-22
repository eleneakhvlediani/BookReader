//
//  Int+Extension.swift
//  BookReader
//
//  Created by Elene Akhvlediani on 2/20/19.
//  Copyright © 2019 Elene Akhvlediani. All rights reserved.
//

import Foundation

extension Int {
    var isPrime: Bool {
        guard self > 1 else { return false }
        let sqrtValue = self.sqrtIntValue
        guard sqrtValue > 1 else { return true }
        var isPrime = true
        (2..<sqrtValue + 1).forEach { i in
            if self % i == 0 {
                isPrime = false
            }
        }
        return isPrime
    }
    var sqrtIntValue: Int {
        return Int(sqrt(Double(self)))
    }
}
