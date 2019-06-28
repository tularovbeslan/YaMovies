//
//  ResourceListObject.swift
//  YaMovies
//
//  Created by Beslan Tularov on 28/06/2019.
//  Copyright © 2019 Beslan Tularov. All rights reserved.
//

import Foundation
import RealmSwift

class ResourceListObject: Object {
    
    @objc dynamic var name: String = ""
    @objc dynamic var created: String = ""
    @objc dynamic var resourceId: String = UUID().uuidString
    @objc dynamic var path: String = ""
    @objc dynamic var type: String = ""
    let items = List<ResourceObject>()
    
    override static func primaryKey() -> String? {
        return "resourceId"
    }
}
