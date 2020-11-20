//
//  YandexOauthServiceImp.swift
//  YaMovies
//
//  Created by Beslan Tularov on 26/06/2019.
//  Copyright © 2019 Beslan Tularov. All rights reserved.
//

import Foundation
import Alamofire

enum YandexEndpoints: String {
    
    case base = "https://oauth.yandex.ru"
    case code = "/device/code"
    case token = "/token"
}

struct YandexOauthServiceImp: YandexOauthService {
    
    
    func requestAccessCode(completion: @escaping (ResponceCode) -> Void) {
        
        let uuid = UUID().uuidString
        let deviceName = UIDevice.current.name.replacingOccurrences(of: " ", with: "")
        let clientId = Utils.id
        let url = URL(string: YandexEndpoints.base.rawValue + YandexEndpoints.code.rawValue)!
        let scope = ["cloud_api:disk.app_folder", "cloud_api:disk.read", "cloud_api:disk.write", "cloud_api:disk.info", "yadisk:disk"]
        let parameters: [String : Any] = ["client_id": "\(clientId)", "device_id": "\(uuid)", "device_name": "\(deviceName)", "scope" : scope]
        let headers: HTTPHeaders = HTTPHeaders(["Content-type" : "application/json"])
        AF.request(url, method: .post, parameters: parameters, headers: headers)
            .validate()
            .responseDecodable(of: ResponceCode.self) { response in
            guard let responceCode = response.value else { return }
            completion(responceCode)
        }
    }
    
    func requestTokenByDevice(_ code: String, completion: @escaping (ResponceToken) -> Void) {
        
        let clientSecret = Utils.password
        let clientId = Utils.id
        let url = URL(string: YandexEndpoints.base.rawValue + YandexEndpoints.token.rawValue)!
        let parameters: [String : String] = ["client_id": "\(clientId)", "client_secret": "\(clientSecret)", "grant_type": "device_code", "code" : code]
        let basic = clientId + ":" + clientSecret
        guard let data = basic.data(using: .utf8) else { return }
        
        let headers: HTTPHeaders = HTTPHeaders(["Authorization" : "Basic \(data.base64EncodedString())"])
        
        AF.request(url, method: .post, parameters: parameters, headers: headers)
            .validate()
            .responseDecodable(of: ResponceToken.self) { response in
            guard let responceCode = response.value else { return }
            completion(responceCode)
        }
    }
    
    func getResourceBy(_ path: String, limit: Int, offset: Int, completion: @escaping (Resource) -> Void) {
        
        guard let token = UserDefaultsManager.accessToken else { return }
        let url = URL(string: "https://cloud-api.yandex.net/v1/disk/resources")!
        let parameters: [String : Any] = ["path": path, "limit" : limit, "offset" : offset, "preview_size" : "L", "sort": "created", "media_type" : "video"]
        let headers: HTTPHeaders = HTTPHeaders(["Authorization" : "OAuth \(token)", "Content-type" : "application/json"])
        
        AF.request(url, method: .get, parameters: parameters, headers: headers)
            .validate()
            .responseDecodable(of: Resource.self) { response in
            guard let responceCode = response.value else { return }
            completion(responceCode)
        }
    }
}
