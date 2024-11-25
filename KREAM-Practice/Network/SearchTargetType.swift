//
//  SearchTargetType.swift
//  KREAM-Practice
//
//  Created by 허준호 on 11/22/24.
//

import Foundation
import Moya

enum SearchTargetType{
    case getAllResults(query: String)
}

extension SearchTargetType: TargetType{
    var baseURL: URL {
        guard let baseURL = URL(string: "https://dummyjson.com") else {
            fatalError("Error: Invalid URL")
        }
        
        return baseURL
    }
    
    var path: String {
        switch self {
            case .getAllResults: return "/products/search"
        }
    }
    
    var method: Moya.Method {
        switch self {
            case .getAllResults: return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case let .getAllResults(query):
            return .requestParameters(
                parameters: ["q": query], encoding: URLEncoding.queryString)
            
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    
}
