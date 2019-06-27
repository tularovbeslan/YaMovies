//
//  UserDefaultsManager.swift
//  YaMovies
//
//  Created by Beslan Tularov on 26/06/2019.
//  Copyright © 2019 Beslan Tularov. All rights reserved.
//

import Foundation

class UserDefaultsManager {
    
    static let accessTokenKey = "accessTokenKey"
    static let expiresInKey = "expiresInKey"
    static let refreshTokenKey = "refreshTokenKey"

    static var accessToken: String? {
        get { return UserDefaults.standard.value(forKey: accessTokenKey) as? String}
        set { UserDefaults.standard.set(newValue, forKey: accessTokenKey) }
    }
    
    static var refreshToken: String? {
        get { return UserDefaults.standard.value(forKey: refreshTokenKey) as? String}
        set { UserDefaults.standard.set(newValue, forKey: refreshTokenKey) }
    }
    
    static var expiresIn: Int? {
        get { return UserDefaults.standard.value(forKey: expiresInKey) as? Int}
        set { UserDefaults.standard.set(newValue, forKey: expiresInKey) }
    }
}
