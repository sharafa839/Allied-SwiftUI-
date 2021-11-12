//
//  BaseApi.swift
//  Baladna
//
//  Created by sharaf on 30/10/2021.
//

import Foundation
import Alamofire

class BaseApi <T:TargetType> {
    func fetchData<M:Codable>(target:T,responseClass:M.Type,compeleteion:@escaping(Result<M?,NSError>)->Void){
        let method = Alamofire.HTTPMethod(rawValue: target.method.rawValue)
        let headers = Alamofire.HTTPHeaders(target.headers ?? [:])
        let parms = buildParms(task: target.task)
        AF.request(target.baseURL+target.path, method:method, parameters: parms.0, encoding: parms.encoding, headers: headers).responseJSON { res in
            guard let statusCode = res.response?.statusCode else {
                compeleteion(.failure(NSError()))
                return
            }
            if statusCode == 200 {
                guard  let jsonResponse = try? res.result.get() else {
                    compeleteion(.failure(NSError()))
                    return
                }
                guard  let theJsonData = try? JSONSerialization.data(withJSONObject: jsonResponse, options: .prettyPrinted) else {
                    compeleteion(.failure(NSError()))
                    return
                }
                guard  let responseObject = try? JSONDecoder().decode(M.self, from: theJsonData) else {
                    compeleteion(.failure(NSError()))
                    return
                }
                compeleteion(.success(responseObject))
                
            }
            
        }
    }
    private func buildParms (task:Task)-> ([String:Any],encoding:ParameterEncoding){
        switch task {
        case .requestPlain:
            return ([:],URLEncoding.default)
        case .requestParmters(parms: let parms, encoding: let encoding):
        return (parms,encoding)
        }
    }
}
