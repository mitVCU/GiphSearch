//
//  NetworkService.swift
//  GiphSearch
//
//

import Foundation

enum NetworkError: Error {
    case dataFailure
    case badResponse
    case badDecoding
    case noURL
}

struct NetworkService {
    static func request<T: Codable> (type: T.Type, _ endpoint: GifEndpoint) async throws -> T {
        guard let url = endpoint.url else {
            throw NetworkError.noURL
        }
                
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else {
            throw NetworkError.badResponse
        }
        
        do {
            return try JSONDecoder().decode(type, from: data)
        } catch {
            throw NetworkError.badDecoding
        }
    }
}
