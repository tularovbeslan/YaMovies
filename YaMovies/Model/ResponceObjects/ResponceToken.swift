//
//  ResponceToken.swift
//  YaMovies
//
//  Created by Beslan Tularov on 27/06/2019.
//  Copyright © 2019 Beslan Tularov. All rights reserved.
//

import Foundation

struct ResponceToken: Decodable {
    
    let token_type: String?
    let access_token: String
    let expires_in: Int?
    let refresh_token: String?
    let error_description: String?
    let error: String?
}
