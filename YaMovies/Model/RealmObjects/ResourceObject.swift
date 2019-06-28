//
//  VideoObject.swift
//  YaMovies
//
//  Created by Beslan Tularov on 27/06/2019.
//  Copyright © 2019 Beslan Tularov. All rights reserved.
//

import Foundation
import RealmSwift

class ResourceObject: Object {
    
    @objc dynamic var name: String = ""
    @objc dynamic var created: String = ""
    @objc dynamic var resourceId: String = UUID().uuidString
    @objc dynamic var path: String = ""
    @objc dynamic var file: String = ""
    @objc dynamic var mediaType: String = ""
    @objc dynamic var preview: String = ""
    @objc dynamic var type: String = ""
    @objc dynamic var size: Int = 0
    
    override static func primaryKey() -> String? {
        return "resourceId"
    }
}
