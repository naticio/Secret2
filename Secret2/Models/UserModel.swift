//
//  User.swift
//  Secret2
//
//  Created by Nat-Serrano on 8/15/21.
//

import Foundation

struct User: Encodable, Decodable,  {
    var uid:String
    var email: String
    var profileImageUrl: String
    var username:String
    var searchName: [String] //array of strings
    var bio: String
}
