//
//  YaError.swift
//  YaMovies
//
//  Created by Beslan Tularov on 27/06/2019.
//  Copyright © 2019 Beslan Tularov. All rights reserved.
//

import Foundation

struct YaError: Decodable {
    
    let message: String?
    let description: String?
    let error: Int?
}
