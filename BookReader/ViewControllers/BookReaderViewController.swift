//
//  BookReaderViewController.swift
//  BookReader
//
//  Created by Elene Akhvlediani on 2/20/19.
//  Copyright © 2019 Elene Akhvlediani. All rights reserved.
//

import UIKit

class BookReaderViewController: UIViewController {
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var resultTextView: UITextView!
    let bookReaderViewModel = BookReaderViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Count words"
        activityIndicator.startAnimating()
        resultTextView.isHidden = true
        readFile()
    }
    
    func readFile() {
       bookReaderViewModel.getInfoForReadFile() { [weak self] result in
            DispatchQueue.main.async {
                self?.activityIndicator.stopAnimating()
                self?.resultTextView.isHidden = false
                switch result {
                case .success(let value):
                    self?.resultTextView.text = value
                    self?.resultTextView.textColor = .defaultText
                case .failure(let errorDescription):
                    self?.resultTextView.text = errorDescription
                    self?.resultTextView.textColor = .error
                }
            }
        }
    }
}

