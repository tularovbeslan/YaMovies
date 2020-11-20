//
//  YandexOauthService.swift
//  YaMovies
//
//  Created by Beslan Tularov on 26/06/2019.
//  Copyright © 2019 Beslan Tularov. All rights reserved.
//

import Foundation

protocol YandexOauthService {
    
    func requestAccessCode(completion: @escaping (ResponceCode) -> Void)
    func requestTokenByDevice(_ code: String, completion: @escaping (ResponceToken) -> Void)
    func getResourceBy(_ path: String, limit: Int, offset: Int, completion: @escaping (Resource) -> Void)
}
