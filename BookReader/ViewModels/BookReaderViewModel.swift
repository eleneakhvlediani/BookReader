//
//  BookReaderViewModel.swift
//  BookReader
//
//  Created by Elene Akhvlediani on 21/02/2019.
//  Copyright © 2019 Elene Akhvlediani. All rights reserved.
//

import Foundation

class BookReaderViewModel {
    var fileReader: FileReader?
    let wordCounter = WordCounter()
    
    func getInfoForReadFile(completionHandler: @escaping (Result<String>) -> Void ){
        guard let fileReader = self.fileReader else {
            fatalError("File Reader must be provided when using this")
        }
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let self = self else { return }
            let description = self.readFile(fileReader: fileReader).description
            completionHandler(.success(description))
        }
    }
    
    private func readFile(fileReader: FileReader) -> [WordInfo] {
        let countedWordsArray = wordCounter
            .countWords(in: fileReader)
            .map({ key, value -> WordInfo in
                return WordInfo(name: key, count: value, isPrime: value.isPrime)
            })
        return countedWordsArray
    }
}
