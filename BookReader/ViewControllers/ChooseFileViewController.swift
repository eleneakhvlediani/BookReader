//
//  ChooseFileViewController.swift
//  BookReader
//
//  Created by Elene Akhvlediani on 21/02/2019.
//  Copyright © 2019 Elene Akhvlediani. All rights reserved.
//

import UIKit

class ChooseFileViewController: UIViewController {
    
    @IBOutlet weak var urlTextField: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var textFieldLine: UIView!
    let viewModel = ChooseFileViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Choose file"
    }
    
    @IBAction func downloadClicked(_ sender: UIButton) {
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        view.isUserInteractionEnabled = false
        viewModel.downloadFile(url: urlTextField.text ?? "") {result in
            DispatchQueue.main.async {  [weak self] in
                self?.view.isUserInteractionEnabled = true
                self?.activityIndicator.stopAnimating()
                switch result {
                case .success(let fileReader):
                    self?.showBookReaderViewController(with: fileReader)
                    self?.textFieldLine.backgroundColor = .clear
                case .failure:
                    self?.textFieldLine.backgroundColor = .error
                }
            }
        }
        
    }
    @IBAction func chooseDefaultClicked(_ sender: Any) {
        do {
            let fileReader = try FileReader.makeFor(fileName: viewModel.defaultFileName)
            showBookReaderViewController(with: fileReader)
        } catch {
            print("error")
        }
    }
    
    private func showBookReaderViewController(with fileReader: FileReader) {
        let bookReaderViewController: BookReaderViewController = UIStoryboard.main.instantiate()
        bookReaderViewController.bookReaderViewModel.fileReader = fileReader
        self.navigationController?.pushViewController(bookReaderViewController, animated: true)
    }
}
