//
//  UserViewModel.swift
//  AlliedProject
//
//  Created by sharaf on 12/11/2021.
//

import Foundation
final class UserViewModel:ObservableObject{
    @Published  var Users = [payload]()
    @Published  var isLoading = false
    let api : UserApiProtocol =  CallApi()
    func getUser(){
        isLoading = true
        api.getData{ [weak self] result in
            guard let self = self else {return}
            self.isLoading = false
            switch result {
            case .success(let response):
                guard  let users = response?.results else {
                    return
                }
                self.Users = users
                
            case.failure(let err):
               fatalError("err\(err)")
            }
        }
    }
}
