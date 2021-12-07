//
//  UserModel.swift
//  MyRecipes
//
//  Created by haju Kim on 2021/12/07.
//

import Foundation

struct User: Encodable, Decodable {
    
    var uid: String
    var email : String
    var profileImageURL: String
    var username: String
  
}

