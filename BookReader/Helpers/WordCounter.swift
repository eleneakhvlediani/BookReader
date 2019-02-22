//
//  WordCounter.swift
//  BookReader
//
//  Created by Elene Akhvlediani on 2/21/19.
//  Copyright © 2019 Elene Akhvlediani. All rights reserved.
//

import Foundation

class WordCounter {
    func countWords<T: Sequence>(in sequence: T) -> [String: Int]  where T.Element == String {
        var countedWords = [String: Int]()
        sequence
            .map { $0.lowercased() }
            .forEach { line in
                let words = line.components(separatedBy: .whitespacesAndNewlines)
                words
                    .map { $0.trimmingCharacters(in: .punctuationCharacters) }
                    .filter { !$0.isEmpty }
                    .forEach { word in
                        if let currentNumber = countedWords[word] {
                            countedWords[word] = currentNumber + 1
                        } else {
                            countedWords[word] = 1
                        }
                }
        }
        return countedWords
    }
}
