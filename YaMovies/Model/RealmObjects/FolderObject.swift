//
//  FolderObject.swift
//  YaMovies
//
//  Created by Beslan Tularov on 27/06/2019.
//  Copyright © 2019 Beslan Tularov. All rights reserved.
//

import Foundation
import RealmSwift

class FolderObject: Object {
    
    @objc dynamic var name: String = ""
    @objc dynamic var created: String = ""
    @objc dynamic var resourceId: String = UUID().uuidString
    @objc dynamic var path: String = ""
    @objc dynamic var type: String = ""
    
    override static func primaryKey() -> String? {
        return "resourceId"
    }
    
    convenience init(name: String,
                     created: String,
                     resourceId: String,
                     path: String,
                     type: String) {
        
        self.init()
        self.name = name
        self.created = created
        self.resourceId = resourceId
        self.path = path
        self.type = type
    }
}
