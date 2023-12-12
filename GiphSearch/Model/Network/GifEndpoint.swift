//
//  Endpoint.swift
//  GiphSearch
//
//

import Foundation
enum GifEndpoint {
    case search(term: String)
    
    private var apiKey: String {
      get {
        // 1
        guard let filePath = Bundle.main.path(forResource: "Info", ofType: "plist") else {
          fatalError("Couldn't find file 'Info.plist'.")
        }
        // 2
        let plist = NSDictionary(contentsOfFile: filePath)
        guard let value = plist?.object(forKey: "Api Key") as? String else {
          fatalError("Couldn't find key 'API_KEY' in 'Info.plist'.")
        }
        return value
      }
    }

    private var scheme: String  { return "https" }
    private var baseURL: String { return "api.giphy.com" }

    private var path: String {
        switch self {
        case .search:
            return "/v1/gifs/search"
        }
    }
    
    private var method: String {
        switch self {
        case .search:
            return "GET"
        }
    }

    private var queryParams: [URLQueryItem] {
        var result: [URLQueryItem] = []
        switch self {
        case .search(let term):
            result.append(URLQueryItem(name: "api_key", value: "\(self.apiKey)"))
            result.append(URLQueryItem(name: "limit",   value: "25"))
            result.append(URLQueryItem(name: "offset",  value: "0"))
            result.append(URLQueryItem(name: "rating",  value: "G"))
            result.append(URLQueryItem(name: "lang",    value: "en"))
            result.append(URLQueryItem(name: "q",       value: "\(term)"))
           
        }
        return result
    }
    
    var url: URL? {
        var components = URLComponents()
        components.scheme = self.scheme
        components.host = self.baseURL
        components.path = self.path
        components.queryItems = self.queryParams
        return components.url
    }
}


