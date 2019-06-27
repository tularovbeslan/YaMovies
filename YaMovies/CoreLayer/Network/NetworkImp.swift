//
//  NetworkImp.swift
//  YaMovies
//
//  Created by Beslan Tularov on 24/06/2019.
//  Copyright © 2019 Beslan Tularov. All rights reserved.
//

import Foundation
import Alamofire
import CodableAlamofire

class NetworkImp: Network {
    
    private var requests = [DataRequest]()
    
    // MARK: - NetworkClient
    func requestData(_ url: URL, method: HTTPMethod, parameters: [String : Any], headers: [String : String]?, encoding: Encoding, completion: @escaping DataCompletion) {
        buildRequest(url: url, method, parameters, headers: headers, encoding: parameterEncoding(for: encoding)).response { (dataResponse) in
            completion(dataResponse.data, dataResponse.error)
        }
    }
    
    func requestJSON(_ url: URL, method: HTTPMethod, parameters: [String : Any], headers: [String : String]?, encoding: Encoding, completion: @escaping JSONCompletion) {
        buildRequest(url: url, method, parameters, headers: headers, encoding: parameterEncoding(for: encoding)).responseJSON { (jsonResponse) in
            if jsonResponse.result.isSuccess {
                completion(jsonResponse.result.value, nil)
            } else {
                completion(nil, jsonResponse.result.error)
            }
        }
    }
    
    func requestObject<T: Decodable>(_ url: URL, method: HTTPMethod, parameters: [String : Any], headers: [String : String]?, encoding: Encoding, objectType: T.Type, completion: @escaping ObjectCompletion<T>) {
        buildRequest(url: url, method, parameters, headers: headers, encoding: parameterEncoding(for: encoding))
            .responseDecodableObject { (response: DataResponse<T>) in
                if response.result.isSuccess {
                    completion(response.result.value, nil)
                } else {
                    completion(nil, response.result.error)
                }
        }
    }
    
    // MARK: - Helpers
    
    private func parameterEncoding(for encoding: Encoding) -> ParameterEncoding {
        switch encoding {
        case .json:
            return JSONEncoding.default
        default:
            return URLEncoding.default
        }
    }
    
    private func buildRequest(url: URL, _ method: HTTPMethod, _ params: Parameters, headers: HTTPHeaders?, encoding: ParameterEncoding) -> DataRequest {
        let request = Alamofire.request(url, method: method, parameters: params, encoding: encoding, headers: headers)
        requests.append(request)
        return request
    }
}
