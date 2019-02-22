//
//  Result.swift
//  BookReader
//
//  Created by Elene Akhvlediani on 21/02/2019.
//  Copyright © 2019 Elene Akhvlediani. All rights reserved.
//

import Foundation
enum Result<T> {
    case success(T)
    case failure(description: String)
}
