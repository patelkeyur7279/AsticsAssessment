//
//  Router.swift
//  AsticsAssessment
//
//  Created by Keyur Patel on 16/01/23.
//

import Foundation
import Alamofire

enum Router {
    case search(country: String)
    
    var path: String {
        switch self {
        case .search:
            return "search"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .search:
            return .get
        }
    }
    
    var parameters: [String: String]? {
        switch self {
        case .search(let country):
            return [
                "country": country
            ]
        }
    }
    
}

extension Router: URLRequestConvertible {
    func asURLRequest() throws -> URLRequest {
        let url = try BASE_URL.asURL().appendingPathComponent(path)
        print("URL: \(url)")
        var request = URLRequest(url: url)
        request.method = method
        request = try URLEncoding.default.encode(request, with: parameters)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        return request
    }
}
