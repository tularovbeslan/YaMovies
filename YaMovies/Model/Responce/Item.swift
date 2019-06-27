//
//  Item.swift
//  YaMovies
//
//  Created by Beslan Tularov on 27/06/2019.
//  Copyright © 2019 Beslan Tularov. All rights reserved.
//

import Foundation

struct Item: Decodable {
    
    let name: String?
    let exif: Exif?
    let created: String?
    let resource_id: String?
    let modified: String?
    let path: String?
    let comment_ids: CommentIds?
    let type: String?
    let revision: Int?
}
