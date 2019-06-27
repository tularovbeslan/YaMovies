//
//  YandexOauthService.swift
//  YaMovies
//
//  Created by Beslan Tularov on 26/06/2019.
//  Copyright © 2019 Beslan Tularov. All rights reserved.
//

import Foundation

protocol YandexOauthService {
    
    func requestAccessCode(completion: @escaping (ResponceCode?, Error?) -> Void)
    func requestTokenByDevice(_ code: String, completion: @escaping (ResponceToken?, Error?) -> Void)
    func getResourceBy(_ path: String, limit: Int, offset: Int, completion: @escaping (ResponceResource?, Error?) -> Void)
}
