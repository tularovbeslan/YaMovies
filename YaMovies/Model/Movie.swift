//
//  Movie.swift
//  YaMovies
//
//  Created by Beslan Tularov on 24/06/2019.
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
    let comment_ids: commentIds?
    let type: String?
    let revision: Int?
//    let error: YaError?
    
}

struct Embedded: Decodable {
    
    let sort: String?
    let items: [Item]?
    let limit: Int?
    let offset: Int?
    let path: String?
    let total: Int?
}

struct Item: Decodable {
    
    let name: String?
    let exif: Exif?
    let created: String?
    let resource_id: String?
    let modified: String?
    let path: String?
    let comment_ids: commentIds?
    let type: String?
    let revision: Int?
}

struct Exif: Decodable {
    let date_time: String?
}

struct commentIds: Decodable {
    
    let private_resource: String?
    let public_resource: String?
}

struct ResponceCode: Decodable {
    
    let device_code: String
    let user_code: String
    let verification_url: String
    let interval: Int
    let expires_in: Int
}

struct ResponceToken: Decodable {
    
    let token_type: String?
    let access_token: String?
    let expires_in: Int?
    let refresh_token: String?
    let error_description: String?
    let error: String?
}

struct YaError: Decodable {
    
    let message: String?
    let description: String?
    let error: Int?
}
