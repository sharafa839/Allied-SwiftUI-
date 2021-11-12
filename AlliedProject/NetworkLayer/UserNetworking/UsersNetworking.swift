//
//  UsersNetworking.swift
//  Baladna
//
//  Created by sharaf on 31/10/2021.
//

import Foundation
import Alamofire
enum GetRequest {
    //cases with function that i use in Auth Module
    case getUsers
}
extension GetRequest:TargetType{

    var baseURL: String {
        switch self {
        
        default:
            return "https://raw.githubusercontent.com"
        }
    }
    
    var path: String {
        switch self {
        case .getUsers:
            return "/EsraaAbdelmotteleb/DuetAPI/gh-pages/project.json"
    
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getUsers:
            return .get
       
        }
    }
    
    var task: Task {
        switch self {
        case .getUsers:
            return .requestPlain
      
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return [:]
       
    }
    
    }
}
