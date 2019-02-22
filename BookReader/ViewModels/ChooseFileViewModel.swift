//
//  ChooseFileViewModel.swift
//  BookReader
//
//  Created by Elene Akhvlediani on 21/02/2019.
//  Copyright © 2019 Elene Akhvlediani. All rights reserved.
//

import Foundation
class ChooseFileViewModel {
    let defaultFileName = "Railway-Children-by-E-Nesbit"
    let fileDownloader: FileDownloader
    init(fileDownloader: FileDownloader = FileDownloader()) {
        self.fileDownloader = fileDownloader
    }
    func downloadFile(url: String, completionHandler: @escaping  (Result<FileReader>) -> Void) {
        let documentDirectory = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor:nil, create:false)
        guard let fileURL = documentDirectory?.appendingPathComponent("downloaded"),
            let url =  URL(string: url) else {
                completionHandler(.failure(description: FileDownloader.Error.invalidURL.localizedDescription))
                return
        }
        load(from: url, to: fileURL, completionHandler: completionHandler)
    }
    
    private func load(from: URL, to: URL,  completionHandler: @escaping  (Result<FileReader>) -> Void) {
        fileDownloader.load(url: from, to: to) { result in
            switch result {
            case .success:
                let fileReader = try! FileReader(path: to.path)
                completionHandler(.success(fileReader))
            case .failure(let description):
                completionHandler(.failure(description: description))
            }
        }
    }
}
