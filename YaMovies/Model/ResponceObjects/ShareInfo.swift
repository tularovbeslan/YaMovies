//
//  ShareInfo.swift
//  YaMovies
//
//  Created by Beslan Tularov on 28/06/2019.
//  Copyright © 2019 Beslan Tularov. All rights reserved.
//

import Foundation

struct ShareInfo: Decodable {
    let is_root: Bool?
    let is_owned: Bool?
    let rights: String
}
