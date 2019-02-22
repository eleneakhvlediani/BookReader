//
//  FileReader.swift
//  BookReader
//
//  Created by Elene Akhvlediani on 2/20/19.
//  Copyright © 2019 Elene Akhvlediani. All rights reserved.
//

import Foundation

class FileReader {
    enum Error: Swift.Error {
        case fileNotFound
    }
    let path: String
    private let file: UnsafeMutablePointer<FILE>!
    init(path: String) throws {
        self.path = path
        file = fopen(path, "r")
        guard file != nil else { throw Error.fileNotFound }
    }
    var nextLine: String? {
        var line:UnsafeMutablePointer<CChar>? = nil
        var linecap:Int = 0
        defer { free(line) }
        return getline(&line, &linecap, file) > 0 ? String(cString: line!) : nil
    }
    deinit {
        fclose(file)
    }
    
    static func makeFor(fileName: String, in bundle: Bundle = .main) throws -> FileReader {
        guard let path = bundle.path(forResource: fileName, ofType: "txt") else {
            throw FileReader.Error.fileNotFound
        }
        return try FileReader(path: path)
    }
}

extension FileReader: Sequence {
    public func  makeIterator() -> AnyIterator<String> {
        return AnyIterator<String> {
            return self.nextLine
        }
    }
}
