//
//  NetworkClient.swift
//  Advantage
//
//  Created by Paris Makris on 25/4/25.
//

import Foundation


class NetworkClient: NSObject {
    
    //MARK: - Execute Function
    
    func execute<T: Codable, E: Error>(
        host urlHost: String = "",
        endpoint: String = "",
        authToken: String = "",
        queryItems: [String: String] = [:],
        urlScheme: URLScheme = .https,
        urlPort: Int? = nil,
        httpMethod: HttpMethod = .get,
        headers: [String: String] = [:],
        timeInterval: Double = 60,
        requestBody: Data? = nil
    ) async -> Result<T?, E> where E: Codable {
        do {
            
            let url = try buildURL(
                scheme: urlScheme,
                host: urlHost,
                port: urlPort,
                endpoint: endpoint,
                queryItems: queryItems
            )
            
            let request = buildRequest(
                url: url,
                httpMethod: httpMethod,
                headers: headers,
                timeInterval: timeInterval,
                requestBody: requestBody,
                authToken: authToken
            )
            NetworkLogger.log(request: request)
            let (data, response) = try await URLSession.shared.data(for: request)
            let successResponse: Result<T?, E> = try await handleResponse(data, response)
            return successResponse
            
        } catch let error as E {
            return .failure(error)
            
        } catch let error as NetworkError {
            Logger.error(error.errorDescription())
            return .success(nil)
        } catch(let error) {
            Logger.error(error.localizedDescription)
            return .success(nil)
        }
    }
    
    //MARK: - HANDLE  RESPONSE
    
    private func handleResponse<T: Codable, E: Error>(_ data: Data, _ response: URLResponse) async throws -> Result<T, E> where E: Codable{
        guard let response = response as? HTTPURLResponse else { throw NetworkError.badResponse}
        
        NetworkLogger.log(response: response, data: data, error: nil)
        
        if response.isSuccess{
            if let successResponse = try? JSONDecoder().decode(T.self, from: data) {
                return .success(successResponse)
            }else{
                throw NetworkError.failedToDecodeResponse
            }
        }
        
        switch response.statusCode {
        case 401, 451:
            print(response.statusCode)
            if let errorResponse = try? JSONDecoder().decode(E.self, from: data) {
                throw errorResponse
            }
        case 400...599:
            if let errorResponse = try? JSONDecoder().decode(E.self, from: data) {
                throw errorResponse
            }
        default:
            throw NetworkError.unknown
        }
        throw NetworkError.unknown
    }
    
    //MARK: - BUILD URL FUNCTION
    
    private func buildURL(
        url completedUrl: String? = nil,
        scheme: URLScheme = .https,
        host: String = "",
        port: Int? = nil,
        endpoint path: String = "",
        queryItems: [String: String] = [:]
        
    ) throws -> URL {
        if let url = completedUrl{
            guard let prefixedURL = URL(string: url) else { throw NetworkError.invalidUrl("") }
            return prefixedURL
        }
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme.rawValue
        urlComponents.host = host
        urlComponents.path = path
        urlComponents.port = port
        var queryItemsArray: [URLQueryItem] = []
        queryItems.forEach({queryItemsArray.append(URLQueryItem(name: $0, value: $1))})
        urlComponents.queryItems = queryItemsArray
        guard let url = urlComponents.url else { throw NetworkError.invalidUrl("") }
        return url
    }
    
    //MARK: - BUILD REQUEST FUNCTION
    
    private func buildRequest(
        url: URL,
        httpMethod: HttpMethod = .get,
        headers: [String: String] = [:],
        timeInterval: Double,
        requestBody: Data? = nil,
        authToken: String = ""
    ) -> URLRequest {
        var request = URLRequest(url: url, timeoutInterval: timeInterval)
        request.httpMethod = httpMethod.rawValue
        headers.forEach({request.setValue($1, forHTTPHeaderField: $0)})
        if !authToken.isEmpty{
            request.setValue("Bearer " + authToken, forHTTPHeaderField: "Authorization")
        }
        request.httpBody = requestBody
        return request
    }
    
}
