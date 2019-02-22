//
//  FileDownloader.swift
//  BookReader
//
//  Created by Elene Akhvlediani on 21/02/2019.
//  Copyright © 2019 Elene Akhvlediani. All rights reserved.
//

import Foundation
class FileDownloader {
    enum Error: Swift.Error {
        case invalidURL
    }
    
    func load(url: URL, to localUrl: URL, completion: @escaping (Result<Void>) -> ()) {
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = session.downloadTask(with: request) { (tempLocalUrl, response, error) in
            if let tempLocalUrl = tempLocalUrl, error == nil {
                if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                    print("Success: \(statusCode)")
                }
                do {
                    try FileManager.default.removeItem(at: localUrl)
                    try FileManager.default.copyItem(at: tempLocalUrl, to: localUrl)
                    completion(.success(()))
                } catch {
                    completion(.failure(description: error.localizedDescription))
                }
            } else if let error = error {
                completion(.failure(description: error.localizedDescription))
            }
        }
        task.resume()
    }
}
