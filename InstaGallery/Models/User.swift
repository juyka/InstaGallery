//
//  User.swift
//  InstaGallery
//
//  Created by Анастасия Васюра on 10/07/16.
//  Copyright © 2016 Анастасия Васюра. All rights reserved.
//

import Foundation

struct User {
    let id: String
    let name: String
}

extension User {
    
    static func decode(json: JSON) -> User? {
        
        guard
            let id: String = json["id"].inferType(),
            let name: String = json["username"].inferType()
            else { return nil }
        
        return User(id: id, name: name)
    }
}