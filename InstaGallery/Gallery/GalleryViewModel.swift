//
//  GalleryViewModel.swift
//  InstaGallery
//
//  Created by Анастасия Васюра on 10/07/16.
//  Copyright © 2016 Анастасия Васюра. All rights reserved.
//

import Foundation

class GalleryViewModel {
    
    let instagramService = InstagramService()
    let user: User
    var mediaItems: [MediaItem] = []

    init(user: User) {
        self.user = user
    }
    
    func loadMedia(completion: (NSError?) -> ()) {
        instagramService.loadMedia(userID: user.id) { json, error in
            
            if let json = json, let data: [AnyObject] = json["data"].inferType() {
                let mediaItems = data.map(JSON.Object).flatMap(MediaItem.decode)
                self.mediaItems = mediaItems
                completion(nil)
            } else {
                completion(error)
            }
        }
    }
}
