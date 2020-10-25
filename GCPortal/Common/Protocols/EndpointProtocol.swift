//
//  EndpointProtocol.swift
//  GCPortal
//
//  Created by Айдин Абдурахманов on 23.10.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import Foundation
import Alamofire

public typealias Parameters = [String: Any] // A dictionary of parameters to apply to a `URLRequest`
//public typealias HTTPHeaders = [HTTPHeader] // A dictionary of headers to apply to a `URLRequest`
public typealias Method = HTTPMethod
public typealias Headers = Alamofire.HTTPHeaders

protocol EndpointProtocol {
    
    var baseUrl: URL? { get }
    var path: String { get }
    var method: Method { get }
    var parameters: Parameters? { get }
    var encoding: ParameterEncoding { get }
    var headers: Headers? { get }
    var keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy { get }
}

extension EndpointProtocol {
    
    var baseUrl: URL? {
        return ServiceConstants.baseUrl
    }
    
    var encoding: ParameterEncoding {
        switch method {
        case .get:
            return URLEncoding.queryString
        default:
            return URLEncoding.default
        }
    }
    var parameters: Parameters? {
        return nil
    }
    
    var headers: Headers? {
//        TODO: - Вшить токен
        return .init(["Authorization" : "Bearer"])
    }
    
    var keyDecodingStrategy: JSONDecoder.KeyDecodingStrategy {
        return .useDefaultKeys
    }
    
}

