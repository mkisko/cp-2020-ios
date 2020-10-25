//
//  NetworkService.swift
//  GCPortal
//
//  Created by Айдин Абдурахманов on 23.10.2020.
//  Copyright © 2020 Айдин Абдурахманов. All rights reserved.
//

import Foundation
import Alamofire

// MARK: - Network Service Implementation
final class NetworkService<Endpoint: EndpointProtocol> {
    
    // MARK: - Init
    
    init() {
        
        self.decoder = JSONDecoder()
        self.decoder.dateDecodingStrategy = JSONDecoder.DateDecodingStrategy.millisecondsSince1970
        
        let sessionConfiguration = URLSessionConfiguration.default
        sessionConfiguration.timeoutIntervalForRequest = ServiceConstants.requestTimeout
        sessionConfiguration.timeoutIntervalForResource = ServiceConstants.resourceTimeout
        
        let headers = Alamofire.SessionManager.defaultHTTPHeaders
        sessionConfiguration.httpAdditionalHeaders = headers
        
        #if DEBUG
        let serverTrustPolicies: [String: ServerTrustPolicy] = ["test.05.ru": .disableEvaluation, "local.test.05.ru": .disableEvaluation]
        self.alamofireManager = Alamofire.SessionManager(configuration: sessionConfiguration, serverTrustPolicyManager: ServerTrustPolicyManager(policies: serverTrustPolicies))
        #else
        self.alamofireManager = Alamofire.SessionManager(configuration: sessionConfiguration)
        #endif
        
    }
    
    
    // MARK: - Properties
    
    private let decoder: JSONDecoder
    private let alamofireManager: SessionManager
    
    
    func request<Response>(
        endpoint: Endpoint,
        completion: @escaping (Result<Response>) -> Void) where Response: Decodable {
        
        guard let baseUrl = endpoint.baseUrl else {
            completion(Result.failure(.noBaseUrl))
            return
        }
        
        decoder.keyDecodingStrategy = endpoint.keyDecodingStrategy
        
        let url = baseUrl.appendingPathComponent(endpoint.path)
        
        alamofireManager.request(url, method: endpoint.method,
                                 parameters: endpoint.parameters,
                                 encoding: endpoint.encoding,
                                 headers: endpoint.headers).response { [weak self] response in
                                    
                                    print(String(data: response.data ?? Data(), encoding: String.Encoding.utf8))
                                    print(response.response?.statusCode)
                                    
                                    guard let self = self else { return }
                                    
                                    let result: Result<Response>
                                    
                                    defer {
                                        DispatchQueue.main.async {
                                            completion(result)
                                        }
                                    }
                                    
                                    guard let httpResponse = response.response else {
                                        result = Result.failure(APIError.noNetwork)
                                        return
                                    }
                                    
                                    if httpResponse.statusCode == 401 {
                                        result = Result.failure(APIError.notAuthorized)
                                        return
                                    }
                                    
                                    guard let data = response.data else {
                                        let serverError = self.createServerError(from: response)
                                        result = Result.failure(serverError)
                                        return
                                    }
                                    
                                    do {
                                        
                                        let json = try JSONSerialization.jsonObject(with: data, options: [])
                                        print(json)
                                        
                                        let object = try self.decoder.decode(Response.self, from: data)
                                        result = Result.success(object)
                                        
                                    } catch (let decodingError) {
                                        print(decodingError)
                                        let serverError = self.createServerError(from: response)
                                        result = Result.failure(serverError)
                                    }
                                    
        }
        
    }
    
    
    // MARK: - Upload request
    
    func uploadRequest<Response>(
        endpoint: Endpoint, data: Data,
        progressHandler: ((Double) -> Void)? = nil,
        completion: @escaping (Result<Response>) -> Void) where Response: Decodable {
        
        guard let baseUrl = endpoint.baseUrl else {
            completion(Result.failure(.noBaseUrl))
            return
        }
        
        let url = baseUrl.appendingPathComponent(endpoint.path)
        
        let progressUpdateBlock: (Progress) -> Void = { progress in
            progressHandler?(progress.fractionCompleted)
        }
        
        let responseHandler: (DefaultDataResponse) -> Void = { [weak self] response in
            
            guard let self = self else { return }
            
            let result: Result<Response>
            
            defer {
                DispatchQueue.main.async {
                    completion(result)
                }
            }
            
            guard let httpResponse = response.response else {
                result = Result.failure(APIError.noNetwork)
                return
            }
            
            guard (ServiceConstants.validCodes ~= httpResponse.statusCode) else {
                let serverError = self.createServerError(from: response)
                result = Result.failure(serverError)
                return
            }
            
            guard let data = response.data else {
                let serverError = self.createServerError(from: response)
                result = Result.failure(serverError)
                return
            }
            
            do {
                let object = try self.decoder.decode(Response.self, from: data)
                result = Result.success(object)
            } catch {
                result = Result.failure(.decodingError)
            }
            
        }
        
        alamofireManager.upload(data, to: url,
                                method: endpoint.method,
                                headers: endpoint.headers)
            .uploadProgress(queue: DispatchQueue.main, closure: progressUpdateBlock)
            .response(completionHandler: responseHandler)
        
    }
    
    
    // MARK: - Helper methods
    
    private func createServerError(from response: DefaultDataResponse) -> APIError {
        
        guard let data = response.data else {
            return APIError.serverError(error: response.error, response: response.response, data: response.data)
        }
        
        do {
            let error = try decoder.decode(SuccessModel<ParsableError>.self, from: data)
            return APIError.parsableError(error.result)
            
        } catch {
            return APIError.serverError(error: response.error, response: response.response, data: response.data)
        }
    }
    
}

