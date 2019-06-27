//
//  Item.swift
//  YaMovies
//
//  Created by Beslan Tularov on 27/06/2019.
//  Copyright © 2019 Beslan Tularov. All rights reserved.
//

import Foundation

struct Resource: Decodable {
    
    let resource_id: String?
    let share: ShareInfo?
    let file: String?
    let size: Int?
    let photoslice_time: String?
    let _embedded: ResourceList?
    let exif: Exif?
    let media_type: String?
    let sha256: String?
    let type: String
    let mime_type: String?
    let revision: Int?
    let public_url: String?
    let path: String
    let md5: String?
    let public_key: String?
    let preview: String?
    let name: String
    let created: String
    let modified: String
    let comment_ids: CommentIds?
}
