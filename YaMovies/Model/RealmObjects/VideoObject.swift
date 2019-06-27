//
//  VideoObject.swift
//  YaMovies
//
//  Created by Beslan Tularov on 27/06/2019.
//  Copyright © 2019 Beslan Tularov. All rights reserved.
//

import Foundation
import RealmSwift

class VideoObject: Object {
    
    @objc dynamic var name: String = ""
    @objc dynamic var created: String = ""
    @objc dynamic var resourceId: String = ""
    @objc dynamic var path: String = ""
    @objc dynamic var file: String = ""
    @objc dynamic var mediaType: String = ""
    @objc dynamic var preview: String = ""
    @objc dynamic var publicUrl: String = ""
    @objc dynamic var type: String = ""
    @objc dynamic var size: Int = 0
    
    override static func primaryKey() -> String? {
        return "resourceId"
    }
    
    convenience init(name: String,
                     created: String,
                     resourceId: String,
                     path: String,
                     file: String,
                     mediaType: String,
                     preview: String,
                     publicUrl: String,
                     type: String,
                     size: Int) {
        
        self.init()
        self.name = name
        self.created = created
        self.resourceId = resourceId
        self.path = path
        self.file = file
        self.mediaType = mediaType
        self.preview = preview
        self.publicUrl = publicUrl
        self.type = type
        self.size = size
    }
}
