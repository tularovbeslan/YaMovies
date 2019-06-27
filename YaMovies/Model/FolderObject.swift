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
    
    dynamic var name: String = ""
    dynamic var created: String = ""
    dynamic var resource_id: String = ""
    dynamic var path: String = ""
    dynamic var type: String = ""
}
