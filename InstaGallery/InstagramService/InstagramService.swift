//
//  InstagramService.swift
//  InstaGallery
//
//  Created by Анастасия Васюра on 10/07/16.
//  Copyright © 2016 Анастасия Васюра. All rights reserved.
//

import Foundation

class InstagramService {
    
    private let baseUrl = "https://api.instagram.com"
    private let accessToken = "3530556175.d80311b.0467cbe21c2d44fdb10cba4a995d1fdd"
    private let requestManager = RequestManager()
    
    func findUsers(name name: String, completion:(JSON?, NSError?) -> ()) {
        let urlString = baseUrl + "/v1/users/search?access_token=" + accessToken + "&q=" + name
        let url = NSURL(string: urlString)
        requestManager.sendRequest(url: url!, completion: completion)
    }
    
    func loadMedia(userID userID: String, completion:(JSON?, NSError?) -> ()) {
        let urlString = baseUrl + "/v1/users/" + userID + "/media/recent?access_token=" + accessToken
        let url = NSURL(string: urlString)
        requestManager.sendRequest(url: url!, completion: completion)
    }
}
