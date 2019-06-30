//
//  TokenPlugin.swift
//  YaMovies
//
//  Created by Beslan Tularov on 30/06/2019.
//  Copyright © 2019 Beslan Tularov. All rights reserved.
//

import Foundation
import Kingfisher

class TokenPlugin: ImageDownloadRequestModifier {
    
    let token:String
    
    init(token:String) {
        self.token = "OAuth " + token
    }
    
    func modified(for request: URLRequest) -> URLRequest? {
        
        var request = request
        request.addValue(token, forHTTPHeaderField: "Authorization")
        return request
    }
}
