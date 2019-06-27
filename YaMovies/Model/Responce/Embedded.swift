//
//  Embedded.swift
//  YaMovies
//
//  Created by Beslan Tularov on 27/06/2019.
//  Copyright © 2019 Beslan Tularov. All rights reserved.
//

import Foundation

struct Embedded: Decodable {
    
    let sort: String?
    let items: [Item]?
    let limit: Int?
    let offset: Int?
    let path: String?
    let total: Int?
}
