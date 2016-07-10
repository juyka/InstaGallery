//
//  MediaItem.swift
//  InstaGallery
//
//  Created by Анастасия Васюра on 10/07/16.
//  Copyright © 2016 Анастасия Васюра. All rights reserved.
//

import Foundation

struct MediaItem {
    let id: String
    let url: NSURL
}

extension MediaItem {
    
    static func decode(json: JSON) -> MediaItem? {
        
        guard
            let id: String = json["id"].inferType(),
            let urlString: String = json["images"]["standard_resolution"]["url"].inferType(),
            let url = NSURL(string: urlString)
            else { return nil }
        
        return MediaItem(id: id, url: url)
    }
}


