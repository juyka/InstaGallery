//
//  SearchViewModel.swift
//  InstaGallery
//
//  Created by Анастасия Васюра on 10/07/16.
//  Copyright © 2016 Анастасия Васюра. All rights reserved.
//

import Foundation

final class SearchViewModel {
    let instagramService = InstagramService()
    var users: [User] = []
    
    func search(term: String, completion: ([User]?, NSError?) -> ()) {
        instagramService.findUsers(name: term) { json, error in
            
            if let json = json, let data: [AnyObject] = json["data"].inferType() {
                let users: [User] = data.map(JSON.Object).flatMap(User.decode)
                self.users = users
                completion(users, nil)
            } else {
                completion(nil, error)
            }
        }
    }
}
