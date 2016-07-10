//
//  UIImageView+ImageLoading.swift
//  InstaGallery
//
//  Created by Анастасия Васюра on 10/07/16.
//  Copyright © 2016 Анастасия Васюра. All rights reserved.
//

import UIKit

extension UIImageView {
    func load(imageUrl: NSURL) {
        let request = NSURLRequest(URL: imageUrl)
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: onMain { (imageData, response, error) in
            if let imageData = imageData {
                self.image = UIImage(data: imageData)
            }
        })
        task.resume()
    }
}