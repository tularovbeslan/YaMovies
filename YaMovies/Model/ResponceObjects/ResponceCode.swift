//
//  ResponceCode.swift
//  YaMovies
//
//  Created by Beslan Tularov on 27/06/2019.
//  Copyright © 2019 Beslan Tularov. All rights reserved.
//

import Foundation

struct ResponceCode: Decodable {
    
    let device_code: String
    let user_code: String
    let verification_url: String
    let interval: Int
    let expires_in: Int
}
