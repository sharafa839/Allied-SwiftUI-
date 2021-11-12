//
//  AuthModel.swift
//  Baladna
//
//  Created by sharaf on 31/10/2021.
//

import Foundation
struct UsersModel: Codable {
    let results: [payload]
}

// MARK: - Result
struct payload : Codable,Identifiable,Hashable{
    var id : Int?
    let name, height, mass, hairColor: String
    let skinColor, eyeColor, birthYear, gender: String
    let image: String

    enum CodingKeys: String, CodingKey {
        case name, height, mass
        case hairColor = "hair_color"
        case skinColor = "skin_color"
        case eyeColor = "eye_color"
        case birthYear = "birth_year"
        case gender, image
    }
}
struct MockData {
    
    static let users = [sampleUser]
        static let sampleUser = payload(id: 1, name: "Cat", height: "1.5", mass: "5.6", hairColor: "brown", skinColor: "white", eyeColor: "green", birthYear: "2014", gender: "female", image: "https://i.pinimg.com/564x/29/e7/44/29e74452966b404bad72a9cd7cd67302.jpg")
}
