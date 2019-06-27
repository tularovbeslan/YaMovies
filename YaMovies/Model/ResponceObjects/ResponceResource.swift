//
//  ResponceResource.swift
//  YaMovies
//
//  Created by Beslan Tularov on 27/06/2019.
//  Copyright © 2019 Beslan Tularov. All rights reserved.
//

import Foundation

struct ResponceResource: Decodable {
    
    let _embedded: Embedded?
    let name: String?
    let exif: Exif?
    let resource_id: String?
    let created: String?
    let modified: String?
    let path: String?
    let comment_ids: CommentIds?
    let type: String?
    let revision: Int?
}
