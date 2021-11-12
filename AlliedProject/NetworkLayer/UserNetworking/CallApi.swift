//
//  AuthApi.swift
//  Baladna
//
//  Created by sharaf on 31/10/2021.
//

import Foundation
protocol UserApiProtocol {
    func getData(compeletion : @escaping(Result<UsersModel?,NSError>)->Void)
}
class CallApi:BaseApi<GetRequest> , UserApiProtocol {
    func getData(compeletion : @escaping(Result<UsersModel?,NSError>)->Void){
        self.fetchData(target: .getUsers, responseClass: UsersModel.self) { (data) in
            compeletion(data)
        }
    }
}
